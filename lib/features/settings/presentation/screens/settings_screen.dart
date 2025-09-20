import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/providers/theme_provider.dart';
import '../../../../shared/providers/language_provider.dart';
import '../../../../shared/providers/auth_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settings),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          // Theme Section
          _buildSection(
            context,
            title: 'Theme',
            children: [
              _buildSwitchTile(
                context,
                title: 'Dark Mode',
                subtitle: 'Switch between light and dark themes',
                value: themeProvider.isDarkMode,
                onChanged: (value) {
                  themeProvider.toggleTheme();
                },
              ),
              _buildSwitchTile(
                context,
                title: 'High Contrast',
                subtitle: 'Enable high contrast for better accessibility',
                value: themeProvider.isHighContrast,
                onChanged: (value) {
                  themeProvider.toggleHighContrast();
                },
              ),
            ],
          ),

          const SizedBox(height: AppSpacing.lg),

          // Language Section
          _buildSection(
            context,
            title: 'Language',
            children: [
              _buildLanguageTile(context, languageProvider: languageProvider),
            ],
          ),

          const SizedBox(height: AppSpacing.lg),

          // Accessibility Section
          _buildSection(
            context,
            title: 'Accessibility',
            children: [
              _buildSwitchTile(
                context,
                title: 'Large Text',
                subtitle: 'Use larger text sizes for better readability',
                value: themeProvider.isLargeText,
                onChanged: (value) {
                  themeProvider.toggleLargeText();
                },
              ),
              _buildSwitchTile(
                context,
                title: 'Reduce Motion',
                subtitle: 'Reduce animations for better accessibility',
                value: themeProvider.isReducedMotion,
                onChanged: (value) {
                  themeProvider.toggleReducedMotion();
                },
              ),
            ],
          ),

          const SizedBox(height: AppSpacing.lg),

          // Account Section
          _buildSection(
            context,
            title: 'Account',
            children: [
              _buildListTile(
                context,
                title: l10n.logout,
                subtitle: 'Sign out of your account',
                icon: Icons.logout,
                onTap: () {
                  _showLogoutDialog(context, authProvider);
                },
              ),
            ],
          ),

          const SizedBox(height: AppSpacing.lg),

          // App Info Section
          _buildSection(
            context,
            title: 'App Information',
            children: [
              _buildListTile(
                context,
                title: 'Version',
                subtitle: '1.0.0',
                icon: Icons.info_outline,
                onTap: null,
              ),
              _buildListTile(
                context,
                title: 'About KifePool',
                subtitle: 'Your Gateway to the Polkadot Ecosystem',
                icon: Icons.info,
                onTap: () {
                  _showAboutDialog(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: AppSpacing.sm,
            bottom: AppSpacing.sm,
          ),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildSwitchTile(
    BuildContext context, {
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
      activeColor: AppColors.primary,
    );
  }

  Widget _buildListTile(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: onTap,
      trailing: onTap != null ? const Icon(Icons.chevron_right) : null,
    );
  }

  Widget _buildLanguageTile(
    BuildContext context, {
    required LanguageProvider languageProvider,
  }) {
    return ExpansionTile(
      title: const Text('Language'),
      subtitle: Text(languageProvider.currentLanguageName),
      leading: const Icon(Icons.language),
      children: languageProvider.availableLanguages.map((language) {
        final isSelected = language.locale == languageProvider.currentLocale;
        return ListTile(
          leading: Text(language.flag, style: const TextStyle(fontSize: 24)),
          title: Text(language.name),
          trailing: isSelected
              ? const Icon(Icons.check, color: AppColors.primary)
              : null,
          onTap: () {
            languageProvider.changeLanguage(language.locale);
          },
        );
      }).toList(),
    );
  }

  void _showLogoutDialog(BuildContext context, AuthProvider authProvider) {
    final l10n = AppLocalizations.of(context);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.logout),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              authProvider.logout();
            },
            child: Text(l10n.logout),
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'KifePool',
      applicationVersion: '1.0.0',
      applicationIcon: const Icon(
        Icons.account_balance_wallet,
        size: 48,
        color: AppColors.primary,
      ),
      children: [
        const Text(
          'KifePool is your gateway to the Polkadot ecosystem. '
          'Manage your assets, stake tokens, and stay updated with the latest news.',
        ),
      ],
    );
  }
}
