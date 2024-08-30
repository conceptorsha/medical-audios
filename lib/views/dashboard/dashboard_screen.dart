import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import '../../nav_bar/navigation_bar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final DashboardController controller = Get.put(DashboardController());

  @override
  void initState() {
    super.initState();
    controller.loadMedicalItems();
    controller.loadNewUpdates();
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // final double _screenHeight = MediaQuery.of(context).size.height;
    final double _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Get.toNamed('/search'); // Navigate to SearchScreen
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Implement notifications functionality
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hey Danny\n what will you listen to today?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.filterItems('All');
                    },
                    child: const Text('All'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.filterItems('Cardiology');
                    },
                    child: const Text('Cardiology'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/Dermatology');
                    },
                    child: const Text('Dermatology'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Recently Played',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Obx(
                    () => SizedBox(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = controller.filteredItems[index];
                      return GestureDetector(
                        onTap: () {
                          controller.navigateToDetailPage(item);
                        },
                        child: Container(
                          width: _screenWidth / 2.2,
                          margin: const EdgeInsets.only(right: 10),
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  item.image,
                                  fit: BoxFit.cover,
                                  height: 100,
                                  width: double.infinity,
                                ),
                                const SizedBox(height: 8),
                                Text(item.title,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 4),
                                Flexible(
                                  child: Text(
                                    item.description,
                                    style: const TextStyle(fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(item.time, style: const TextStyle(fontSize: 12)),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(Icons.star,
                                        size: 14, color: Colors.yellow),
                                    Text('${item.rating}',
                                        style: const TextStyle(fontSize: 12)),
                                    const SizedBox(width: 4),
                                    Text('(${item.ratingCount} ratings)',
                                        style: const TextStyle(fontSize: 12)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'New Updates',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Obx(
                    () => SizedBox(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.newUpdates.length,
                    itemBuilder: (context, index) {
                      final item = controller.newUpdates[index];
                      return GestureDetector(
                        onTap: () {
                          controller.navigateToDetailPage(item);
                        },
                        child: Container(
                          width: _screenWidth / 2.2,
                          margin: const EdgeInsets.only(right: 10),
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  item.image,
                                  fit: BoxFit.cover,
                                  height: 100,
                                  width: double.infinity,
                                ),
                                const SizedBox(height: 8),
                                Text(item.title,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 4),
                                Flexible(
                                  child: Text(
                                    item.description,
                                    style: const TextStyle(fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(item.time, style: const TextStyle(fontSize: 12)),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(Icons.star,
                                        size: 14, color: Colors.yellow),
                                    Text('${item.rating}',
                                        style: const TextStyle(fontSize: 12)),
                                    const SizedBox(width: 4),
                                    Text('(${item.ratingCount} ratings)',
                                        style: const TextStyle(fontSize: 12)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
