import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/cardiology_model.dart';
import '../../controllers/cardio_controllers.dart';

class CardioScreen extends StatelessWidget {
  final CardioController controller = Get.put(CardioController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cardio Library'),
        centerTitle: true,
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
              // Handle notification functionality
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Button Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle "All" button press
                  },
                  child: Text('All'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle "Cardiology" button press
                  },
                  child: Text('Cardiology'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle "Dermatology" button press
                  },
                  child: Text('Dermatology'),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Card List
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: controller.cardioUnits.length,
                  itemBuilder: (context, index) {
                    return _buildCard(controller.cardioUnits[index]);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(CardioUnit unit) {
    return GestureDetector(
      onTap: () {
        controller.navigateToTopic(unit.route); // Navigate to the specified route
      },
      child: Card(
        elevation: 3,
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                unit.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text('${unit.topics} topics | ${unit.duration}'),
            ],
          ),
        ),
      ),
    );
  }
}
