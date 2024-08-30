import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/dashboard/library_screen.dart'; // Ensure file names match exactly
import '../views/dashboard/dashboard_screen.dart';
import '../views/dashboard/profile_screen.dart';
import '../views/dashboard/search_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomBottomNavBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        onTap(index); // Call the onTap function passed from parent
        switch (index) {
          case 0:
            Get.to(() => DashboardPage());
            break;
          case 1:
            Get.to(() => LibraryScreen());
            break;
          case 2:
            Get.to(() => const SearchScreen());
            break;
          case 3:
            Get.to(() =>  ProfileScreen());
            break;
        }
      },
      selectedItemColor: Colors.blue, // Color for the selected item
      unselectedItemColor: Colors.grey, // Color for the unselected items
      backgroundColor: Colors.white, // Background color of the navigation bar
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_books),
          label: 'Library',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
