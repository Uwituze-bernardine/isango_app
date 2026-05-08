import 'package:flutter/material.dart';
import 'package:isango_app/core/theme/app_colors.dart';
import 'package:isango_app/core/theme/app_radii.dart';
import 'package:isango_app/core/theme/app_spacing.dart';
import 'package:isango_app/core/theme/app_text_styles.dart';

class EventDetailScreen extends StatelessWidget {
  const EventDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mistBackground,
      appBar: AppBar(
        backgroundColor: AppColors.cardWhite,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Event Details',
          style: AppTextStyles.title.copyWith(
            fontWeight: FontWeight.w800,
            color: AppColors.logisticsNavy,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.logisticsNavy),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: AppSpacing.lg),
            child: Icon(Icons.bookmark_outline, color: AppColors.logisticsNavy),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.cardWhite,
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x0F000000),
                      blurRadius: 24,
                      offset: Offset(0, 12),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        _buildBadge('Main Campus', AppColors.paleSignalBlue),
                        const SizedBox(width: AppSpacing.sm),
                        _buildBadge('Academic', AppColors.paleSignalBlue),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    Text(
                      'Annual Career Fair 2024',
                      style: AppTextStyles.headline.copyWith(fontSize: 22),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      'Connecting students with industry leaders',
                      style: AppTextStyles.body.copyWith(color: AppColors.mutedOperationalInk),
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    Row(
                      children: [
                        const Icon(Icons.calendar_month_outlined, color: AppColors.logisticsNavy, size: 20),
                        const SizedBox(width: AppSpacing.sm),
                        Text(
                          'Fri, Nov 15',
                          style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(width: AppSpacing.lg),
                        Container(
                          height: 16,
                          width: 1,
                          color: AppColors.softBorder,
                        ),
                        const SizedBox(width: AppSpacing.lg),
                        const Icon(Icons.access_time_outlined, color: AppColors.logisticsNavy, size: 20),
                        const SizedBox(width: AppSpacing.sm),
                        Text(
                          '10:00 AM - 4:00 PM',
                          style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Container(
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
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.paleSignalBlue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.person_outline, color: AppColors.logisticsNavy),
                        ),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Student Career Center',
                                style: AppTextStyles.title.copyWith(fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: AppSpacing.xs),
                              Text(
                                'career-center@university.edu',
                                style: AppTextStyles.body.copyWith(color: AppColors.mutedOperationalInk),
                              ),
                              const SizedBox(height: AppSpacing.xs),
                              Text(
                                'Host: University Services',
                                style: AppTextStyles.body.copyWith(color: AppColors.mutedOperationalInk),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    const Divider(height: 1, color: Color(0xFFF0F4FF)),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                        foregroundColor: AppColors.commandBlue,
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.notifications_none, size: 18),
                          SizedBox(width: AppSpacing.sm),
                          Expanded(child: Text('Remind me: 30 mins before')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Container(
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
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFDF1E9),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.location_city, color: AppColors.safetyOrange),
                        ),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: Text(
                            'Grand Ballroom, Student Union',
                            style: AppTextStyles.title.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      'Format: In-person / Hybrid options available',
                      style: AppTextStyles.body.copyWith(color: AppColors.mutedOperationalInk),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'About the Event',
                style: AppTextStyles.headline.copyWith(fontSize: 20),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Join us for the biggest career event of the year! Over 100 companies will be on campus to meet with students from all faculties. Bring your CV and prepare for on-the-spot interviews.',
                style: AppTextStyles.body.copyWith(color: AppColors.mutedOperationalInk),
              ),
              const SizedBox(height: AppSpacing.lg),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F7FF),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Agenda Summary',
                      style: AppTextStyles.title.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    _buildAgendaItem('10:00 AM', 'Doors Open & Registration'),
                    const SizedBox(height: AppSpacing.sm),
                    _buildAgendaItem('10:30 AM', 'Keynote Address: Future of Work'),
                    const SizedBox(height: AppSpacing.sm),
                    _buildAgendaItem('11:00 AM', 'Networking Sessions Begin'),
                    const SizedBox(height: AppSpacing.sm),
                    _buildAgendaItem('4:00 PM', 'Event Concludes'),
                  ],
                ),
              ),
              const SizedBox(height: 96),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.logisticsNavy,
                  side: const BorderSide(color: AppColors.logisticsNavy),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppRadii.button),
                  ),
                ),
                child: const Text('Set Reminder'),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.safetyOrange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppRadii.button),
                  ),
                ),
                child: const Text('RSVP'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge(String text, Color backgroundColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: AppTextStyles.body.copyWith(
          color: AppColors.logisticsNavy,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildAgendaItem(String time, String label) {
    return Row(
      children: [
        Text(
          time,
          style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(width: AppSpacing.lg),
        Expanded(
          child: Text(
            label,
            style: AppTextStyles.body.copyWith(color: AppColors.logisticsNavy),
          ),
        ),
      ],
    );
  }
}
