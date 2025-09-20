import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';
import 'package:kifepool/shared/providers/wallet_provider.dart';

/// Wallet creation screen
class WalletCreationScreen extends StatefulWidget {
  const WalletCreationScreen({super.key});

  @override
  State<WalletCreationScreen> createState() => _WalletCreationScreenState();
}

class _WalletCreationScreenState extends State<WalletCreationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _chainController = TextEditingController();

  String _selectedChain = 'polkadot';
  int _wordCount = 12;
  bool _isCreating = false;
  String? _generatedMnemonic;
  bool _showMnemonic = false;

  final List<String> _supportedChains = [
    'polkadot',
    'kusama',
    'moonbeam',
    'astar',
    'acala',
  ];

  @override
  void initState() {
    super.initState();
    _chainController.text = _selectedChain;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _chainController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Wallet'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: _showMnemonic ? _buildMnemonicDisplay() : _buildCreationForm(),
    );
  }

  Widget _buildCreationForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'Create New Wallet',
              style: AppTypography.headlineMedium.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: AppSpacing.sm),

            Text(
              'Generate a new wallet with a secure mnemonic phrase',
              style: AppTypography.bodyMedium.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
              ),
            ),

            const SizedBox(height: AppSpacing.xl),

            // Wallet name field
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Wallet Name',
                hintText: 'Enter a name for your wallet',
                prefixIcon: Icon(Icons.account_circle),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a wallet name';
                }
                return null;
              },
            ),

            const SizedBox(height: AppSpacing.lg),

            // Chain selection
            DropdownButtonFormField<String>(
              value: _selectedChain,
              decoration: const InputDecoration(
                labelText: 'Blockchain',
                prefixIcon: Icon(Icons.account_balance),
              ),
              items: _supportedChains.map((chain) {
                return DropdownMenuItem(
                  value: chain,
                  child: Text(chain.toUpperCase()),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedChain = value!;
                  _chainController.text = value;
                });
              },
            ),

            const SizedBox(height: AppSpacing.lg),

            // Word count selection
            Text(
              'Mnemonic Word Count',
              style: AppTypography.bodyMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: AppSpacing.sm),

            Row(
              children: [
                Expanded(
                  child: RadioListTile<int>(
                    title: const Text('12 words'),
                    subtitle: const Text('Standard security'),
                    value: 12,
                    groupValue: _wordCount,
                    onChanged: (value) {
                      setState(() {
                        _wordCount = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<int>(
                    title: const Text('24 words'),
                    subtitle: const Text('Enhanced security'),
                    value: 24,
                    groupValue: _wordCount,
                    onChanged: (value) {
                      setState(() {
                        _wordCount = value!;
                      });
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppSpacing.xl),

            // Security warning
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.errorContainer,
                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.warning,
                    color: Theme.of(context).colorScheme.onErrorContainer,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Text(
                      'Your mnemonic phrase is the only way to recover your wallet. Store it safely and never share it with anyone.',
                      style: AppTypography.bodySmall.copyWith(
                        color: Theme.of(context).colorScheme.onErrorContainer,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.xl),

            // Create button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isCreating ? null : _generateMnemonic,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                ),
                child: _isCreating
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      )
                    : Text(
                        'Generate Mnemonic',
                        style: AppTypography.bodyMedium.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMnemonicDisplay() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Text(
            'Your Mnemonic Phrase',
            style: AppTypography.headlineMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: AppSpacing.sm),

          Text(
            'Write down these ${_wordCount} words in the exact order shown. This is your backup phrase.',
            style: AppTypography.bodyMedium.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
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
                      'Mnemonic Phrase',
                      style: AppTypography.bodyMedium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Clipboard.setData(
                          ClipboardData(text: _generatedMnemonic!),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Mnemonic copied to clipboard'),
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
                  children: _generatedMnemonic!.split(' ').asMap().entries.map((
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

          const SizedBox(height: AppSpacing.lg),

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
                  '• Never share your mnemonic phrase with anyone\n'
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

          // Action buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _showMnemonic = false;
                    });
                  },
                  child: const Text('Back'),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: ElevatedButton(
                  onPressed: _createWallet,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSpacing.md,
                    ),
                  ),
                  child: Text(
                    'I\'ve Saved It',
                    style: AppTypography.bodyMedium.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _generateMnemonic() {
    setState(() {
      _isCreating = true;
    });

    // Simulate mnemonic generation
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _generatedMnemonic =
              'abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about';
          _showMnemonic = true;
          _isCreating = false;
        });
      }
    });
  }

  void _createWallet() async {
    if (_generatedMnemonic == null) return;

    final walletProvider = Provider.of<WalletProvider>(context, listen: false);

    try {
      final result = await walletProvider.createWallet(
        name: _nameController.text,
        chain: _selectedChain,
        wordCount: _wordCount,
      );

      if (result.success) {
        if (mounted) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Wallet created successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to create wallet: ${result.error}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }
}
