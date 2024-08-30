class CardioUnit {
  final String title;
  final int topics;
  final String duration;
  final String route; // Add route property

  CardioUnit({
    required this.title,
    required this.topics,
    required this.duration,
    required this.route, // Initialize route
  });
}

// lib/models/cardiology_book.dart
class CardiologyBook {
  final String image;
  final String title;
  final String subtitle;
  final String Name;
  final String book;
  final String duration;
  final double rating;
  final int numberOfRatings;
  final double starRating;
  final double performance;
  final String description;
  final String bookName;
  final int yearOfPublish;

  // New fields for review details
  final String reviewTitle; // Title of the review
  final String reviewDate;  // Date or time when review was uploaded
  final String reviewDescription; // Description of the review

  CardiologyBook({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.Name,
    required this.book,
    required this.duration,
    required this.rating,
    required this.numberOfRatings,
    required this.starRating,
    required this.performance,
    required this.description,
    required this.bookName,
    required this.yearOfPublish,
    required this.reviewTitle, // Initialize new field
    required this.reviewDate,  // Initialize new field
    required this.reviewDescription, // Initialize new field
  });
}
