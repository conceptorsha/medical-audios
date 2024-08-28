import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/library_controller.dart';
import '../../nav_bar/navigation_bar.dart';

class LibraryScreen extends StatefulWidget {
  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final LibraryController controller = Get.put(LibraryController());
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Get.toNamed('/Search'); // Navigate to SearchScreen
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Implement notifications functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Buttons in a row after the title
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => controller.filterSpecialties('All'),
                    child: Text('All'),
                  ),
                  ElevatedButton(
                    onPressed: () => controller.filterSpecialties('Internal Medicine'),
                    child: Text('Internal Medicine'),
                  ),
                  ElevatedButton(
                    onPressed: () => controller.filterSpecialties('Surgery'),
                    child: Text('Surgery'),
                  ),
                ],
              ),
            ),
            // Display list of filtered specialties on cards
            Obx(() => Column(
              children: controller.filteredSpecialties.map((specialty) {
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Specialty details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(specialty.title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 4),
                              Text('Resources: ${specialty.resources}'),
                              SizedBox(height: 4),
                              Text('Duration: ${specialty.duration}'),
                            ],
                          ),
                        ),
                        // Image at the far right
                        Image.asset(
                          specialty.imagePath,
                          width: 50, // Adjust size as needed
                          height: 50, // Adjust size as needed
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            )),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            // Add navigation logic here if needed
          });
        },
      ),
    );
  }
}
