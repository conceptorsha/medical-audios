import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import '../../nav_bar/navigation_bar.dart';

class DashboardPage extends StatefulWidget {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.white,
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
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hey Danny\n what will you listen to today?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.filterItems('All');
                    },
                    child: Text('All'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.filterItems('Cardiology');
                    },
                    child: Text('Cardiology'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/Dermatology');
                    },
                    child: Text('Dermatology'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Recently Played',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Obx(
                    () => SizedBox(
                  height: 200,
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
                          width: 160,
                          margin: EdgeInsets.only(right: 10),
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
                                SizedBox(height: 8),
                                Text(item.title,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 4),
                                Flexible(
                                  child: Text(
                                    item.description,
                                    style: TextStyle(fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(item.time, style: TextStyle(fontSize: 12)),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(Icons.star,
                                        size: 14, color: Colors.yellow),
                                    Text('${item.rating}',
                                        style: TextStyle(fontSize: 12)),
                                    SizedBox(width: 4),
                                    Text('(${item.ratingCount} ratings)',
                                        style: TextStyle(fontSize: 12)),
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
              SizedBox(height: 20),
              Text(
                'New Updates',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Obx(
                    () => SizedBox(
                  height: 200,
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
                          width: 160,
                          margin: EdgeInsets.only(right: 10),
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
                                SizedBox(height: 8),
                                Text(item.title,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 4),
                                Flexible(
                                  child: Text(
                                    item.description,
                                    style: TextStyle(fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(item.time, style: TextStyle(fontSize: 12)),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(Icons.star,
                                        size: 14, color: Colors.yellow),
                                    Text('${item.rating}',
                                        style: TextStyle(fontSize: 12)),
                                    SizedBox(width: 4),
                                    Text('(${item.ratingCount} ratings)',
                                        style: TextStyle(fontSize: 12)),
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
