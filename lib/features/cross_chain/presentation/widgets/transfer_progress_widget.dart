import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kifepool/core/models/xcm_transfer_models.dart';
import 'package:kifepool/core/services/xcm_transfer_service.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';

/// Transfer progress widget with stepper-style progress indicator
class TransferProgressWidget extends StatefulWidget {
  final String transferId;

  const TransferProgressWidget({super.key, required this.transferId});

  @override
  State<TransferProgressWidget> createState() => _TransferProgressWidgetState();
}

class _TransferProgressWidgetState extends State<TransferProgressWidget> {
  XcmTransferProgress? _progress;
  Timer? _progressTimer;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadProgress();
    _startProgressUpdates();
  }

  @override
  void dispose() {
    _progressTimer?.cancel();
    super.dispose();
  }

  Future<void> _loadProgress() async {
    try {
      final progress = await XcmTransferService.getTransferProgress(
        widget.transferId,
      );
      setState(() {
        _progress = progress;
        _isLoading = false;
        _error = progress?.errorMessage;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  void _startProgressUpdates() {
    _progressTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      _loadProgress();

      // Stop timer if transfer is completed or failed
      if (_progress != null &&
          (_progress!.status == XcmTransferStatus.confirmed ||
              _progress!.status == XcmTransferStatus.failed ||
              _progress!.status == XcmTransferStatus.cancelled)) {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(AppSpacing.radiusLg),
            ),
          ),
          child: Column(
            children: [
              // Handle
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                child: Row(
                  children: [
                    Text(
                      'Transfer Progress',
                      style: AppTypography.headlineSmall,
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),

              const Divider(),

              // Content
              Expanded(
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : _error != null && _progress == null
                    ? _buildErrorState()
                    : _progress != null
                    ? _buildProgressContent(scrollController)
                    : _buildEmptyState(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildErrorState() {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(height: AppSpacing.lg),
          Text('Error Loading Progress', style: AppTypography.headlineSmall),
          const SizedBox(height: AppSpacing.sm),
          Text(
            _error!,
            style: AppTypography.bodyMedium.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.lg),
          ElevatedButton(onPressed: _loadProgress, child: const Text('Retry')),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.hourglass_empty,
            size: 64,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text('Transfer Not Found', style: AppTypography.headlineSmall),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Transfer ID: ${widget.transferId}',
            style: AppTypography.bodyMedium.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildProgressContent(ScrollController scrollController) {
    return SingleChildScrollView(
      controller: scrollController,
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Transfer ID
          _buildInfoRow('Transfer ID', widget.transferId),
          const SizedBox(height: AppSpacing.lg),

          // Progress stepper
          _buildProgressStepper(),
          const SizedBox(height: AppSpacing.lg),

          // Current status
          _buildStatusCard(),
          const SizedBox(height: AppSpacing.lg),

          // Progress details
          _buildProgressDetails(),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: AppTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(child: Text(value, style: AppTypography.bodyMedium)),
      ],
    );
  }

  Widget _buildProgressStepper() {
    final steps = [
      'Transfer Initiated',
      'XCM Message Processing',
      'Destination Processing',
      'Transfer Confirmed',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Progress Steps',
          style: AppTypography.titleMedium.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        ...steps.asMap().entries.map((entry) {
          final index = entry.key;
          final step = entry.value;
          final isCompleted = index < _progress!.currentStep - 1;
          final isCurrent = index == _progress!.currentStep - 1;
          final isFailed =
              _progress!.status == XcmTransferStatus.failed && isCurrent;

          return _buildStepItem(
            step: step,
            isCompleted: isCompleted,
            isCurrent: isCurrent,
            isFailed: isFailed,
            isLast: index == steps.length - 1,
          );
        }),
      ],
    );
  }

  Widget _buildStepItem({
    required String step,
    required bool isCompleted,
    required bool isCurrent,
    required bool isFailed,
    required bool isLast,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Step indicator
        Column(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isFailed
                    ? Theme.of(context).colorScheme.error
                    : isCompleted
                    ? Theme.of(context).colorScheme.primary
                    : isCurrent
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.outline,
                shape: BoxShape.circle,
              ),
              child: isCompleted
                  ? Icon(Icons.check, size: 16, color: Colors.white)
                  : isFailed
                  ? Icon(Icons.close, size: 16, color: Colors.white)
                  : isCurrent
                  ? Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    )
                  : null,
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 40,
                color: isCompleted
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.outline.withOpacity(0.3),
              ),
          ],
        ),
        const SizedBox(width: AppSpacing.md),

        // Step content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                step,
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: isCurrent ? FontWeight.w600 : FontWeight.normal,
                  color: isFailed
                      ? Theme.of(context).colorScheme.error
                      : isCurrent
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSurface,
                ),
              ),
              if (isCurrent &&
                  _progress!.currentStepDescription.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.xs),
                Text(
                  _progress!.currentStepDescription,
                  style: AppTypography.bodySmall.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatusCard() {
    Color statusColor;
    IconData statusIcon;
    String statusText;

    switch (_progress!.status) {
      case XcmTransferStatus.initiated:
        statusColor = Colors.orange;
        statusIcon = Icons.schedule;
        statusText = 'Initiated';
        break;
      case XcmTransferStatus.processing:
        statusColor = Colors.blue;
        statusIcon = Icons.sync;
        statusText = 'Processing';
        break;
      case XcmTransferStatus.confirmed:
        statusColor = Colors.green;
        statusIcon = Icons.check_circle;
        statusText = 'Confirmed';
        break;
      case XcmTransferStatus.failed:
        statusColor = Colors.red;
        statusIcon = Icons.error;
        statusText = 'Failed';
        break;
      case XcmTransferStatus.cancelled:
        statusColor = Colors.grey;
        statusIcon = Icons.cancel;
        statusText = 'Cancelled';
        break;
    }

    return Card(
      color: statusColor.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          children: [
            Icon(statusIcon, color: statusColor, size: 32),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Status: $statusText',
                    style: AppTypography.titleMedium.copyWith(
                      fontWeight: FontWeight.w600,
                      color: statusColor,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    'Progress: ${(_progress!.progressPercentage * 100).round()}%',
                    style: AppTypography.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressDetails() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Transfer Details',
              style: AppTypography.titleMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            _buildInfoRow(
              'Current Step',
              '${_progress!.currentStep} of ${_progress!.totalSteps}',
            ),
            _buildInfoRow(
              'Progress',
              '${(_progress!.progressPercentage * 100).round()}%',
            ),
            _buildInfoRow(
              'Last Updated',
              _formatTimestamp(_progress!.lastUpdated),
            ),
            if (_progress!.errorMessage != null) ...[
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Error: ${_progress!.errorMessage}',
                style: AppTypography.bodyMedium.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inDays}d ago';
    }
  }
}
