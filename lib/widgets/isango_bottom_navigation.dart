import 'package:flutter/material.dart';
import 'package:isango_app/core/constants/app_routes.dart';
import 'package:isango_app/core/theme/app_colors.dart';

class IsangoBottomNavigation extends StatelessWidget {
  const IsangoBottomNavigation({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: 64,
      selectedIndex: currentIndex,
      onDestinationSelected: (index) {
        final routes = <String>[
          AppRoutes.home,
          AppRoutes.saved,
          AppRoutes.submitEvent,
          AppRoutes.settings,
        ];
        if (routes[index] != ModalRoute.of(context)?.settings.name) {
          Navigator.pushReplacementNamed(context, routes[index]);
        }
      },
      backgroundColor: AppColors.cardWhite,
      elevation: 8,
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      surfaceTintColor: Colors.white,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.bookmark_outline),
          selectedIcon: Icon(Icons.bookmark),
          label: 'Saved',
        ),
        NavigationDestination(
          icon: Icon(Icons.add_circle_outline),
          selectedIcon: Icon(Icons.add_circle),
          label: 'Submit',
        ),
        NavigationDestination(
          icon: Icon(Icons.settings_outlined),
          selectedIcon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
