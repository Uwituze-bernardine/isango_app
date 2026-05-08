import 'package:flutter/material.dart';
import 'package:isango_app/core/theme/app_colors.dart';
import 'package:isango_app/core/theme/app_spacing.dart';
import 'package:isango_app/core/theme/app_text_styles.dart';
import 'package:isango_app/widgets/isango_bottom_navigation.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mistBackground,
      appBar: AppBar(
        backgroundColor: AppColors.mistBackground,
        elevation: 0,
        foregroundColor: AppColors.logisticsNavy,
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.lg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Preferences', style: AppTextStyles.headline.copyWith(fontWeight: FontWeight.w800)),
            const SizedBox(height: AppSpacing.lg),
            Container(
              decoration: BoxDecoration(
                color: AppColors.cardWhite,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.softBorder),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Preferred Campus'),
                    subtitle: const Text('Main Campus'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    title: const Text('Event Interests'),
                    subtitle: Row(
                      children: const [
                        Chip(label: Text('Tech')),
                        SizedBox(width: 8),
                        Chip(label: Text('Design')),
                        SizedBox(width: 8),
                        Chip(label: Text('+ Add')),
                      ],
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            Text('Reminders', style: AppTextStyles.headline.copyWith(fontWeight: FontWeight.w800)),
            const SizedBox(height: AppSpacing.lg),
            Container(
              decoration: BoxDecoration(
                color: AppColors.cardWhite,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.softBorder),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Reminder Timing'),
                    subtitle: const Text('30m before'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  SwitchListTile(
                    title: const Text('RSVP Defaults'),
                    subtitle: const Text('Auto-add to calendar'),
                    value: true,
                    onChanged: (_) {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            Text('App Experience', style: AppTextStyles.headline.copyWith(fontWeight: FontWeight.w800)),
            const SizedBox(height: AppSpacing.lg),
            Container(
              decoration: BoxDecoration(
                color: AppColors.cardWhite,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.softBorder),
              ),
              child: Column(
                children: [
                  SwitchListTile(
                    title: const Text('Compact Mode'),
                    subtitle: const Text('Hide event images in lists'),
                    value: false,
                    onChanged: (_) {},
                  ),
                  const Divider(height: 1),
                  SwitchListTile(
                    title: const Text('Data-saving Mode'),
                    subtitle: const Text('Reduce image quality'),
                    value: false,
                    onChanged: (_) {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            Text('About', style: AppTextStyles.headline.copyWith(fontWeight: FontWeight.w800)),
            const SizedBox(height: AppSpacing.lg),
            Container(
              decoration: BoxDecoration(
                color: AppColors.cardWhite,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.softBorder),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Version'),
                    trailing: const Text('v1.2.0'),
                    onTap: null,
                  ),
                  const Divider(height: 1),
                  ListTile(
                    title: const Text('Support & Feedback'),
                    trailing: const Icon(Icons.open_in_new, size: 18),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFEEBE8),
                foregroundColor: AppColors.criticalRed,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: const Text('Log Out'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
        child: IsangoBottomNavigation(currentIndex: 3),
      ),
    );
  }
}
