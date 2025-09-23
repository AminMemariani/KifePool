import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kifepool/core/theme/app_spacing.dart';
import 'package:kifepool/core/theme/app_typography.dart';
import 'package:kifepool/shared/providers/wallet_provider.dart';
import 'package:kifepool/core/models/wallet_models.dart';
import 'package:kifepool/shared/widgets/dynamic_chain_selector.dart';

/// Wallet import screen
class WalletImportScreen extends StatefulWidget {
  const WalletImportScreen({super.key});

  @override
  State<WalletImportScreen> createState() => _WalletImportScreenState();
}

class _WalletImportScreenState extends State<WalletImportScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _mnemonicController = TextEditingController();
  final _privateKeyController = TextEditingController();

  String? _selectedChainId;
  String _importType = 'mnemonic'; // 'mnemonic' or 'private_key'
  bool _isImporting = false;

  @override
  void initState() {
    super.initState();
    // Set default chain to Polkadot
    _selectedChainId = 'polkadot';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _mnemonicController.dispose();
    _privateKeyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Import Wallet'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                'Import Existing Wallet',
                style: AppTypography.headlineMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: AppSpacing.sm),

              Text(
                'Import your wallet using a mnemonic phrase or private key',
                style: AppTypography.bodyMedium.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.7),
                ),
              ),

              const SizedBox(height: AppSpacing.xl),

              // Import type selection
              Text(
                'Import Method',
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: AppSpacing.sm),

              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Mnemonic'),
                      subtitle: const Text('12 or 24 words'),
                      value: 'mnemonic',
                      groupValue: _importType,
                      onChanged: (value) {
                        setState(() {
                          _importType = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Private Key'),
                      subtitle: const Text('Raw private key'),
                      value: 'private_key',
                      groupValue: _importType,
                      onChanged: (value) {
                        setState(() {
                          _importType = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppSpacing.lg),

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
              DynamicChainSelector(
                selectedChainId: _selectedChainId,
                onChainChanged: (chainId) {
                  setState(() {
                    _selectedChainId = chainId;
                  });
                },
                label: 'Blockchain',
              ),

              const SizedBox(height: AppSpacing.lg),

              // Import input field
              if (_importType == 'mnemonic') ...[
                TextFormField(
                  controller: _mnemonicController,
                  decoration: const InputDecoration(
                    labelText: 'Mnemonic Phrase',
                    hintText: 'Enter your 12 or 24 word mnemonic phrase',
                    prefixIcon: Icon(Icons.text_fields),
                  ),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your mnemonic phrase';
                    }
                    final words = value.trim().split(RegExp(r'\s+'));
                    if (words.length != 12 && words.length != 24) {
                      return 'Mnemonic must be 12 or 24 words';
                    }
                    return null;
                  },
                ),
              ] else ...[
                TextFormField(
                  controller: _privateKeyController,
                  decoration: const InputDecoration(
                    labelText: 'Private Key',
                    hintText: 'Enter your private key',
                    prefixIcon: Icon(Icons.key),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your private key';
                    }
                    return null;
                  },
                ),
              ],

              const SizedBox(height: AppSpacing.lg),

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
                        'Never share your ${_importType == 'mnemonic' ? 'mnemonic phrase' : 'private key'} with anyone. KifePool will encrypt and store it securely on your device.',
                        style: AppTypography.bodySmall.copyWith(
                          color: Theme.of(context).colorScheme.onErrorContainer,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppSpacing.xl),

              // Import button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isImporting ? null : _importWallet,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSpacing.md,
                    ),
                  ),
                  child: _isImporting
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
                          'Import Wallet',
                          style: AppTypography.bodyMedium.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _importWallet() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isImporting = true;
    });

    final walletProvider = Provider.of<WalletProvider>(context, listen: false);

    try {
      WalletImportResult result;

      if (_importType == 'mnemonic') {
        result = await walletProvider.importWalletFromMnemonic(
          mnemonic: _mnemonicController.text.trim(),
          name: _nameController.text,
          chain: _selectedChainId ?? 'polkadot',
        );
      } else {
        result = await walletProvider.importWalletFromPrivateKey(
          privateKey: _privateKeyController.text.trim(),
          name: _nameController.text,
          chain: _selectedChainId ?? 'polkadot',
        );
      }

      if (result.success) {
        if (mounted) {
          // Navigate back to the main app
          Navigator.of(
            context,
          ).pushNamedAndRemoveUntil('/dashboard', (route) => false);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Wallet imported successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to import wallet: ${result.error}'),
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
    } finally {
      if (mounted) {
        setState(() {
          _isImporting = false;
        });
      }
    }
  }
}
