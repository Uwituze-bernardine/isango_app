import 'package:flutter/material.dart';
import 'package:isango_app/core/theme/app_colors.dart';
import 'package:isango_app/core/theme/app_spacing.dart';
import 'package:isango_app/core/theme/app_text_styles.dart';
import 'package:isango_app/widgets/isango_bottom_navigation.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  static final savedEvents = [
    {
      'title': 'Student Tech Expo',
      'date': 'Oct 12, 2024',
      'time': '10:00 AM - 4:00 PM',
      'location': 'Main Campus Center',
      'status': 'RSVP Confirmed',
      'badge': 'Live Now',
      'image': 'https://images.unsplash.com/photo-1519389950473-47ba0277781c?fit=crop&w=800&q=80',
    },
    {
      'title': 'Zen Wellness Session',
      'date': 'Oct 15, 2024',
      'time': '6:00 PM - 7:30 PM',
      'location': 'North Quad Lawn',
      'status': 'RSVP Pending',
      'badge': 'Saved',
      'image': 'https://images.unsplash.com/photo-1518609878373-06d740f60d8b?fit=crop&w=800&q=80',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mistBackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.mistBackground,
        foregroundColor: AppColors.logisticsNavy,
        title: const Text('Saved Events'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.lg,
        ),
        child: Column(
          children: [
            Row(
              children: const [
                Expanded(child: _SegmentButton(label: 'All Saved', selected: true)),
                SizedBox(width: AppSpacing.sm),
                Expanded(child: _SegmentButton(label: 'RSVPs', selected: false)),
                SizedBox(width: AppSpacing.sm),
                Expanded(child: _SegmentButton(label: 'Reminders', selected: false)),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            Expanded(
              child: ListView.separated(
                itemCount: savedEvents.length,
                separatorBuilder: (context, index) => const SizedBox(height: AppSpacing.lg),
                itemBuilder: (context, index) {
                  final event = savedEvents[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.cardWhite,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x0F000000),
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                          child: SizedBox(
                            height: 160,
                            child: Image.network(
                              event['image']!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Container(
                                color: AppColors.paleSignalBlue,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(AppSpacing.lg),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      event['title']!,
                                      style: AppTextStyles.headline.copyWith(fontSize: 18),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: AppSpacing.sm,
                                      vertical: AppSpacing.xs,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.safetyOrange,
                                      borderRadius: BorderRadius.circular(999),
                                    ),
                                    child: Text(
                                      event['badge']!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: AppSpacing.sm),
                              Text(event['date']!, style: AppTextStyles.bodyMuted),
                              const SizedBox(height: AppSpacing.xs),
                              Text(event['time']!, style: AppTextStyles.bodyMuted),
                              const SizedBox(height: AppSpacing.xs),
                              Text(event['location']!, style: AppTextStyles.bodyMuted),
                              const SizedBox(height: AppSpacing.lg),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.notifications_active, size: 18, color: AppColors.logisticsNavy),
                                      const SizedBox(width: AppSpacing.xs),
                                      Text(event['status']!, style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w700)),
                                    ],
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.commandBlue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: const Text('View'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
        child: IsangoBottomNavigation(currentIndex: 1),
      ),
    );
  }
}

class _SegmentButton extends StatelessWidget {
  const _SegmentButton({required this.label, required this.selected});

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFFDCE1FF) : AppColors.cardWhite,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.softBorder),
      ),
      child: Center(
        child: Text(
          label,
          style: AppTextStyles.body.copyWith(
            color: selected ? AppColors.logisticsNavy : AppColors.mutedOperationalInk,
            fontWeight: selected ? FontWeight.w700 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
