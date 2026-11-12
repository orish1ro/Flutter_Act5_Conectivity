import 'package:flutter/material.dart';
import 'home_page.dart';
import 'calculator_screen.dart';
import 'profile_page.dart';
import 'social_media_page.dart';

// MainScreen holds the bottom navigation bar and shows the selected page.
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Which tab is selected: 0 = Home, 1 = Calculator, 2 = Profile, 3 = Social Media
  int selectedIndex = 0;

  // The four pages, in the same order as the tabs.
  // (No "const" on the list itself, so it works even if a page is not const.)
  final List<Widget> pages = [
    const HomePage(),
    const CalculatorScreen(),
    const ProfilePage(),
    const SocialMediaPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack keeps ALL pages alive and only shows the selected one.
      // That is why the calculator keeps its numbers when you switch tabs.
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),

      // The bottom bar with four buttons.
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (int index) {
          // setState() redraws the screen with the newly selected page.
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.calculate_outlined),
            selectedIcon: Icon(Icons.calculate),
            label: 'Calculator',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
          NavigationDestination(
            icon: Icon(Icons.share_outlined),
            selectedIcon: Icon(Icons.share),
            label: 'Social Media',
          ),
        ],
      ),
    );
  }
}