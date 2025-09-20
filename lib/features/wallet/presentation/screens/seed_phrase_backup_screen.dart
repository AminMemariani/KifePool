import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';

/// Seed phrase backup screen with verification
class SeedPhraseBackupScreen extends StatefulWidget {
  final String mnemonic;
  final String walletName;

  const SeedPhraseBackupScreen({
    super.key,
    required this.mnemonic,
    required this.walletName,
  });

  @override
  State<SeedPhraseBackupScreen> createState() => _SeedPhraseBackupScreenState();
}

class _SeedPhraseBackupScreenState extends State<SeedPhraseBackupScreen> {
  int _currentStep = 0;
  List<String> _shuffledWords = [];
  List<String> _selectedWords = [];
  List<int> _selectedIndices = [];
  bool _isVerified = false;

  @override
  void initState() {
    super.initState();
    _shuffledWords = List.from(widget.mnemonic.split(' '));
    _shuffledWords.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Backup Seed Phrase'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            _showExitDialog();
          },
        ),
      ),
      body: _currentStep == 0 ? _buildDisplayStep() : _buildVerificationStep(),
    );
  }

  Widget _buildDisplayStep() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Text(
            'Write Down Your Seed Phrase',
            style: AppTypography.headlineMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: AppSpacing.sm),

          Text(
            'Your seed phrase is the only way to recover your wallet. Write it down and store it in a safe place.',
            style: AppTypography.bodyMedium.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            ),
          ),

          const SizedBox(height: AppSpacing.xl),

          // Security warning
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.errorContainer,
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.warning,
                      color: Theme.of(context).colorScheme.onErrorContainer,
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Text(
                      'Important Security Notes',
                      style: AppTypography.bodyMedium.copyWith(
                        color: Theme.of(context).colorScheme.onErrorContainer,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  '• Never share your seed phrase with anyone\n'
                  '• Store it in a secure location offline\n'
                  '• Anyone with access to this phrase can control your wallet\n'
                  '• KifePool cannot recover your wallet if you lose this phrase',
                  style: AppTypography.bodySmall.copyWith(
                    color: Theme.of(context).colorScheme.onErrorContainer,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.xl),

          // Mnemonic words
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.lg),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
              ),
            ),
            child: Column(
              children: [
                // Copy button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Seed Phrase',
                      style: AppTypography.bodyMedium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: widget.mnemonic));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Seed phrase copied to clipboard'),
                          ),
                        );
                      },
                      icon: const Icon(Icons.copy),
                    ),
                  ],
                ),

                const SizedBox(height: AppSpacing.md),

                // Words grid
                Wrap(
                  spacing: AppSpacing.sm,
                  runSpacing: AppSpacing.sm,
                  children: widget.mnemonic.split(' ').asMap().entries.map((
                    entry,
                  ) {
                    final index = entry.key;
                    final word = entry.value;

                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.sm,
                        vertical: AppSpacing.xs,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusSm,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${index + 1}.',
                            style: AppTypography.bodySmall.copyWith(
                              color: Theme.of(
                                context,
                              ).colorScheme.onPrimaryContainer,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: AppSpacing.xs),
                          Text(
                            word,
                            style: AppTypography.bodySmall.copyWith(
                              color: Theme.of(
                                context,
                              ).colorScheme.onPrimaryContainer,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.xl),

          // Continue button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _currentStep = 1;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
              ),
              child: Text(
                'I\'ve Written It Down',
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerificationStep() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Text(
            'Verify Your Seed Phrase',
            style: AppTypography.headlineMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: AppSpacing.sm),

          Text(
            'Select the words in the correct order to verify you\'ve written them down correctly.',
            style: AppTypography.bodyMedium.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
            ),
          ),

          const SizedBox(height: AppSpacing.xl),

          // Selected words
          Container(
            width: double.infinity,
            constraints: const BoxConstraints(minHeight: 60),
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
              ),
            ),
            child: _selectedWords.isEmpty
                ? Text(
                    'Tap words below to build your seed phrase',
                    style: AppTypography.bodyMedium.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.5),
                    ),
                  )
                : Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: _selectedWords.asMap().entries.map((entry) {
                      final index = entry.key;
                      final word = entry.value;

                      return InkWell(
                        onTap: () {
                          _removeWord(index);
                        },
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusSm,
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.sm,
                            vertical: AppSpacing.xs,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(
                              AppSpacing.radiusSm,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${index + 1}.',
                                style: AppTypography.bodySmall.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: AppSpacing.xs),
                              Text(
                                word,
                                style: AppTypography.bodySmall.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimary,
                                ),
                              ),
                              const SizedBox(width: AppSpacing.xs),
                              Icon(
                                Icons.close,
                                size: 16,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
          ),

          const SizedBox(height: AppSpacing.lg),

          // Available words
          Text(
            'Available Words',
            style: AppTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: AppSpacing.sm),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
              ),
            ),
            child: Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: _shuffledWords.asMap().entries.map((entry) {
                final index = entry.key;
                final word = entry.value;
                final isSelected = _selectedIndices.contains(index);

                return InkWell(
                  onTap: isSelected
                      ? null
                      : () {
                          _addWord(word, index);
                        },
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm,
                      vertical: AppSpacing.xs,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Theme.of(
                              context,
                            ).colorScheme.outline.withOpacity(0.3)
                          : Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                    ),
                    child: Text(
                      word,
                      style: AppTypography.bodySmall.copyWith(
                        color: isSelected
                            ? Theme.of(
                                context,
                              ).colorScheme.onSurface.withOpacity(0.5)
                            : Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: AppSpacing.xl),

          // Verify button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed:
                  _selectedWords.length == widget.mnemonic.split(' ').length
                  ? _verifySeedPhrase
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
              ),
              child: Text(
                'Verify Seed Phrase',
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          if (_isVerified) ...[
            const SizedBox(height: AppSpacing.lg),

            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                border: Border.all(color: Colors.green),
              ),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.green),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Text(
                      'Seed phrase verified successfully!',
                      style: AppTypography.bodyMedium.copyWith(
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.lg),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                ),
                child: Text(
                  'Complete Setup',
                  style: AppTypography.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _addWord(String word, int index) {
    setState(() {
      _selectedWords.add(word);
      _selectedIndices.add(index);
    });
  }

  void _removeWord(int index) {
    setState(() {
      _selectedIndices.removeAt(index);
      _selectedWords.removeAt(index);
    });
  }

  void _verifySeedPhrase() {
    final selectedPhrase = _selectedWords.join(' ');
    final isCorrect = selectedPhrase == widget.mnemonic;

    setState(() {
      _isVerified = isCorrect;
    });

    if (isCorrect) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Seed phrase verified successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Incorrect seed phrase. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _showExitDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Exit Backup?'),
        content: const Text(
          'Are you sure you want to exit? You can backup your seed phrase later, but it\'s recommended to do it now.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('Exit'),
          ),
        ],
      ),
    );
  }
}
