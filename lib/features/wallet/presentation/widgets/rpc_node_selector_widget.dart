import 'package:flutter/material.dart';
import 'package:kifepool/core/constants/rpc_config.dart';
import 'package:kifepool/core/services/rpc_node_service.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';

/// RPC node selector widget
class RpcNodeSelectorWidget extends StatefulWidget {
  final String network;
  final Function(RpcNode)? onNodeSelected;
  final RpcNode? initialNode;

  const RpcNodeSelectorWidget({
    super.key,
    required this.network,
    this.onNodeSelected,
    this.initialNode,
  });

  @override
  State<RpcNodeSelectorWidget> createState() => _RpcNodeSelectorWidgetState();
}

class _RpcNodeSelectorWidgetState extends State<RpcNodeSelectorWidget> {
  List<RpcNode> _availableNodes = [];
  RpcNode? _selectedNode;
  bool _isLoading = false;
  bool _isCheckingHealth = false;

  @override
  void initState() {
    super.initState();
    _loadNodes();
    _selectedNode =
        widget.initialNode ?? RpcNodeService.getSelectedNode(widget.network);
  }

  Future<void> _loadNodes() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final nodes = RpcConfig.getRpcNodes(widget.network);
      setState(() {
        _availableNodes = nodes;
        _selectedNode ??= RpcConfig.getDefaultRpcNode(widget.network);
      });
    } catch (e) {
      debugPrint('Failed to load RPC nodes: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _checkNodeHealth() async {
    setState(() {
      _isCheckingHealth = true;
    });

    try {
      final updatedNodes = await RpcNodeService.checkNetworkHealth(
        widget.network,
      );
      setState(() {
        _availableNodes = updatedNodes;
      });
    } catch (e) {
      debugPrint('Failed to check node health: $e');
    } finally {
      setState(() {
        _isCheckingHealth = false;
      });
    }
  }

  Future<void> _selectNode(RpcNode node) async {
    setState(() {
      _selectedNode = node;
    });

    await RpcNodeService.setSelectedNode(widget.network, node);
    widget.onNodeSelected?.call(node);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Icon(Icons.dns, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  'RPC Node Selection',
                  style: AppTypography.titleMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                if (_isCheckingHealth)
                  const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                else
                  IconButton(
                    onPressed: _checkNodeHealth,
                    icon: const Icon(Icons.refresh),
                    tooltip: 'Check node health',
                  ),
              ],
            ),

            const SizedBox(height: AppSpacing.md),

            // Network info
            Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.public,
                    size: 16,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Text(
                    'Network: ${widget.network.toUpperCase()}',
                    style: AppTypography.bodyMedium.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.md),

            // Node list
            if (_isLoading)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(AppSpacing.lg),
                  child: CircularProgressIndicator(),
                ),
              )
            else
              ..._availableNodes.map((node) => _buildNodeTile(node)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildNodeTile(RpcNode node) {
    final isSelected = _selectedNode?.url == node.url;
    final isHealthy = node.isHealthy;

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: InkWell(
        onTap: () => _selectNode(node),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.outline.withOpacity(0.3),
              width: isSelected ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
            color: isSelected
                ? Theme.of(
                    context,
                  ).colorScheme.primaryContainer.withOpacity(0.3)
                : null,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Node name and status
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          node.name,
                          style: AppTypography.bodyLarge.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (node.isOfficial) ...[
                          const SizedBox(width: AppSpacing.sm),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.xs,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'OFFICIAL',
                              style: AppTypography.labelSmall.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  // Health indicator
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isHealthy ? Colors.green : Colors.red,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  if (isSelected)
                    Icon(
                      Icons.check_circle,
                      color: Theme.of(context).colorScheme.primary,
                      size: 20,
                    ),
                ],
              ),

              const SizedBox(height: AppSpacing.xs),

              // Node URL
              Text(
                node.url,
                style: AppTypography.bodySmall.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.7),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: AppSpacing.xs),

              // Node info
              Row(
                children: [
                  // Region
                  Icon(
                    Icons.location_on,
                    size: 14,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.6),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    node.region,
                    style: AppTypography.bodySmall.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  // Latency
                  Icon(
                    Icons.speed,
                    size: 14,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.6),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    node.latency > 0 ? '${node.latency}ms' : 'Unknown',
                    style: AppTypography.bodySmall.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                  const Spacer(),
                  // Last checked
                  if (node.lastChecked != null)
                    Text(
                      'Checked ${_formatLastChecked(node.lastChecked!)}',
                      style: AppTypography.bodySmall.copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatLastChecked(DateTime lastChecked) {
    final now = DateTime.now();
    final difference = now.difference(lastChecked);

    if (difference.inMinutes < 1) {
      return 'just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inDays}d ago';
    }
  }
}
