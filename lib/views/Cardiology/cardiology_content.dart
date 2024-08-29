import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/audio_controller.dart';
import '../../controllers/topic_controller.dart';

class CardiologyContentScreen extends StatelessWidget {
  final CardiologyContentController _controller = CardiologyContentController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Cardiology Content'),
      ),
      body: SafeArea(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 10.0, // Horizontal spacing
            mainAxisSpacing: 10.0, // Vertical spacing
            childAspectRatio: 0.65, // Adjusted aspect ratio to reduce card size
          ),
          padding: const EdgeInsets.all(10.0),
          itemCount: _controller.items.length,
          itemBuilder: (context, index) {
            final item = _controller.items[index];
            return Card(
              elevation: 3,
              child: GestureDetector(
                onTap: () {
                  print("Card tapped!"); // Debug print
                   final audioController = Get.put(AudioController()); // Initialize controller here
                  print("Setting audio path: ${item.audioPath}"); // Debug print
                  audioController.setAudio(item.audioPath);
                  Get.toNamed('/audio');
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image
                    AspectRatio(
                      aspectRatio: 16 / 9, // Adjust aspect ratio
                      child: Image.asset(
                        item.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          Text(
                            item.title,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),Text(
                            item.subTitle,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4),
                          // Topic
                          Text(
                            'Topic: ${item.topic}',
                            style: TextStyle(fontSize: 12),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4),
                          // Duration
                          Text(
                            'Duration: ${item.duration}',
                            style: TextStyle(fontSize: 12),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 8),
                          // Star Rating
                          Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: List.generate(3, (index) {
                                final starIndex = index + 1;
                                return IconButton(
                                  icon: Icon(
                                    starIndex <= item.rating
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: Colors.yellow,
                                    size: 12.0, // Reduced size of the stars
                                  ),
                                  onPressed: () {
                                    _controller.updateRating(index, starIndex.toDouble());
                                  },
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
