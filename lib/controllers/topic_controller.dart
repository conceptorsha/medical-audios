import 'package:flutter/material.dart';

class CardiologyContentController {
  final List<CardiologyContentItem> items = [
    CardiologyContentItem(
      imagePath: 'assets/images/pediastric.jpeg',
      title: 'Cardiology Basics',
      subTitle: 'cardiology basics',
      topic: 'Topic 1',
      duration: '5 min',
      audioPath: 'assets/Audio/Nishikilie.mp3',
      documentPath: 'assets/Documents/Topic1.pdf', // Add documentPath
      rating: 4.5,
      numRatings: 123,
    ),
    CardiologyContentItem(
      imagePath: 'assets/images/heart.jpeg',
      title: 'Cardiology Basics',
      subTitle: 'cardiology basics',
      topic: 'Topic 2',
      duration: '5 min',
      audioPath: 'assets/Audio/a9298412-8b8d-4353-ab4d-bc8f78e52c9d.wav',
      documentPath: 'assets/Documents/Topic2.pdf', // Add documentPath
      rating: 3.5,
      numRatings: 123,
    ),
    CardiologyContentItem(
      imagePath: 'assets/images/heart.jpeg',
      title: 'Cardiology Basics',
      topic: 'Topic 3',
      subTitle: 'cardiology basics',
      duration: '5 min',
      audioPath: 'assets/Audio/4cfe0827-afc5-4c8b-a5d0-52711a1dd9e5.wav',
      documentPath: 'assets/Documents/Topic3.pdf', // Add documentPath
      rating: 4.0,
      numRatings: 123,
    ),
    CardiologyContentItem(
      imagePath: 'assets/images/heart.jpeg',
      title: 'Cardiology',
      subTitle: 'cardiology basics',
      topic: 'Topic 4',
      duration: '5 min',
      audioPath: 'assets/Audio/Nishikilie.mp3',
      documentPath: 'assets/Documents/Topic4.pdf', // Add documentPath
      rating: 4.5,
      numRatings: 123,
    ),
    // Add more items here
  ];

  void updateRating(int index, double newRating) {
    if (index >= 0 && index < items.length) {
      // Update the rating of the item at the given index
      items[index] = items[index].copyWith(rating: newRating);
    }
  }
}

class CardiologyContentItem {
  final String imagePath;
  final String title;
  final String topic;
  final String subTitle;
  final String duration;
  final String audioPath;
  final String documentPath; // Add documentPath
  double rating;
  final int numRatings;

  CardiologyContentItem({
    required this.imagePath,
    required this.title,
    required this.topic,
    required this.subTitle,
    required this.duration,
    required this.audioPath,
    required this.documentPath, // Add documentPath
    required this.rating,
    required this.numRatings,
  });

  CardiologyContentItem copyWith({
    String? imagePath,
    String? title,
    String? topic,
    String? subTitle,
    String? duration,
    String? audioPath,
    String? documentPath, // Add documentPath
    double? rating,
    int? numRatings,
  }) {
    return CardiologyContentItem(
      imagePath: imagePath ?? this.imagePath,
      title: title ?? this.title,
      topic: topic ?? this.topic,
      subTitle: subTitle ?? this.subTitle,
      duration: duration ?? this.duration,
      audioPath: audioPath ?? this.audioPath,
      documentPath: documentPath ?? this.documentPath, // Add documentPath
      rating: rating ?? this.rating,
      numRatings: numRatings ?? this.numRatings,
    );
  }
}
