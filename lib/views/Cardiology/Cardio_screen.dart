import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/cardio_controllers.dart';
import '../../../model/cardiology_model.dart';

class CardioScreen extends StatelessWidget {
  final CardioController controller = Get.put(CardioController());

  CardioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cardio Library'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Get.toNamed('/Search'); // Navigate to WelcomeScreen
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
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
                  child: const Text('All'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle "Cardiology" button press
                  },
                  child: const Text('Cardiology'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle "Dermatology" button press
                  },
                  child: const Text('Dermatology'),
                ),
              ],
            ),
            const SizedBox(height: 20),

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
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              unit.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text('${unit.topics} topics | ${unit.duration}'),
          ],
        ),
      ),
    );
  }
}
