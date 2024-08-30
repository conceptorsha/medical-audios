import 'package:get/get.dart';

import '../model/cardiology_model.dart';

class CardiologyController extends GetxController {
  var book = CardiologyBook(
    image: 'assets/images/card.jpeg', // Asset image path
    title: 'Cardiology',
    subtitle: 'An Introduction',
    Name: 'Dr. Aiden',
    book: 'Audiobook',
    duration: '3hrs 45 minutes',
    rating: 5.0,
    numberOfRatings: 123,
    starRating: 4.7,
    performance: 4.3,
    description: 'Cover fundamental concepts, heart anatomy, common conditions, and treatments.',
    bookName: 'Cardiology Basics',
    yearOfPublish: 2023,
    reviewTitle: 'Great Resource',
    reviewDate: '2 days ago',
    reviewDescription: 'Thorough understanding of cardiology basics',
  ).obs;

  var rating = 0.0.obs; // Initialize the rating as a reactive variable
  var reviewText = ''.obs; // For the review text

  void setRating(double value) {
    rating.value = value;
  }

  void updateReviewText(String text) {
    reviewText.value = text;
  }

  void submitReview() {
    // Implement the logic to submit the review
    print('Rating: ${rating.value}');
    print('Review: ${reviewText.value}');
    // Reset the rating and review text after submission
    rating.value = 0.0;
    reviewText.value = '';
  }

  void play() {
    // Implement play functionality
  }

  void download() {
    // Implement download functionality
  }

  void addToFavorite() {
    // Implement add to favorite functionality
  }

  void readMore() {
    // Implement read more functionality
  }
}
