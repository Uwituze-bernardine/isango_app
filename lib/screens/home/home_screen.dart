import 'package:flutter/material.dart';
import 'package:isango_app/core/theme/app_colors.dart';
import 'package:isango_app/core/constants/app_routes.dart';
import 'package:isango_app/core/theme/app_spacing.dart';
import 'package:isango_app/core/theme/app_text_styles.dart';
import 'package:isango_app/widgets/isango_bottom_navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const categories = [
    'Academic',
    'Career',
    'Sports',
    'Clubs',
    'Arts',
  ];

  static final upcomingEvents = [
    {
      'title': 'Student Union Leadership Summit 2024',
      'subtitle': 'Student Union',
      'date': 'Oct 15, 10:00 AM',
      'location': 'Student Center',
      'image': 'https://images.unsplash.com/photo-1516455590571-18256e5bb9ff?fit=crop&w=800&q=80',
    },
    {
      'title': 'Fall Semester Career & Internship Fair',
      'subtitle': 'Career Services',
      'date': 'Oct 18, 9:00 AM',
      'location': 'Athletic Complex',
      'image': 'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?fit=crop&w=800&q=80',
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
        title: const Text('Isango'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.lg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                gradient: const LinearGradient(
                  colors: [AppColors.commandBlue, AppColors.logisticsNavy],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1A00236F),
                    blurRadius: 24,
                    offset: Offset(0, 12),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.sm,
                          vertical: AppSpacing.xs,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.safetyOrange,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(Icons.star, color: Colors.white, size: 14),
                            SizedBox(width: 6),
                            Text(
                              'Featured',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Color(0x24FFFFFF),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.bookmark_outline, color: Colors.white, size: 20),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    'Annual Tech Symposium',
                    style: AppTextStyles.headline.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Row(
                    children: const [
                      Icon(Icons.schedule, color: Colors.white, size: 16),
                      SizedBox(width: 8),
                      Text('2:00 PM - 5:00 PM', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Row(
                    children: const [
                      Icon(Icons.location_on_outlined, color: Colors.white, size: 16),
                      SizedBox(width: 8),
                      Text('Main Hall, North Campus', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Register now action not implemented yet')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.safetyOrange,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Text('Register Now'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            SizedBox(
              height: 48,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (context, index) => const SizedBox(width: AppSpacing.sm),
                itemBuilder: (context, index) {
                  final isSelected = index == 0;
                  return ChoiceChip(
                    selected: isSelected,
                    label: Text(categories[index]),
                    labelStyle: AppTextStyles.body.copyWith(
                      color: isSelected ? AppColors.logisticsNavy : AppColors.mutedOperationalInk,
                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.normal,
                    ),
                    selectedColor: const Color(0xFFDCE1FF),
                    backgroundColor: AppColors.cardWhite,
                    side: BorderSide(
                      color: isSelected ? Colors.transparent : AppColors.softBorder,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                    onSelected: (_) {},
                  );
                },
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            Text(
              'Upcoming Events',
              style: AppTextStyles.headline.copyWith(
                color: AppColors.logisticsNavy,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Column(
              children: upcomingEvents.map((event) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.lg),
                  child: InkWell(
                    onTap: () => Navigator.pushNamed(context, AppRoutes.eventDetail),
                    borderRadius: BorderRadius.circular(24),
                    child: Container(
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
                                Text(
                                  event['title']!,
                                  style: AppTextStyles.headline.copyWith(fontSize: 20),
                                ),
                                const SizedBox(height: AppSpacing.sm),
                                Text(
                                  event['subtitle']!,
                                  style: AppTextStyles.body.copyWith(color: AppColors.commandBlue),
                                ),
                                const SizedBox(height: AppSpacing.lg),
                                Row(
                                  children: [
                                    const Icon(Icons.schedule, size: 16, color: AppColors.mutedOperationalInk),
                                    const SizedBox(width: 8),
                                    Text(
                                      event['date']!,
                                      style: AppTextStyles.bodyMuted,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: AppSpacing.sm),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on_outlined, size: 16, color: AppColors.mutedOperationalInk),
                                    const SizedBox(width: 8),
                                    Text(
                                      event['location']!,
                                      style: AppTextStyles.bodyMuted,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
        child: IsangoBottomNavigation(currentIndex: 0),
      ),
    );
  }
}
