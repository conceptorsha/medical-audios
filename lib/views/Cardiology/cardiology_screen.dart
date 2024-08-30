import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/cardiology_controller.dart';


class CardiologyPage extends StatefulWidget {
  const CardiologyPage({super.key});

  @override
  _CardiologyPageState createState() => _CardiologyPageState();
}

class _CardiologyPageState extends State<CardiologyPage> {


  @override
  Widget build(BuildContext context) {
    final CardiologyController controller = Get.put(CardiologyController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cardiology'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Go back to the previous screen
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Get.toNamed('/Search'); // Navigate to WelcomeScreen
            },
          ),
        ],
      ),
      body: Obx(
            () {
          final book = controller.book.value;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 16.0),
                Image.asset(book.image), // Use asset image
                SizedBox(height: 16.0),
                Text(
                  book.title, // Title from controller
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.0),
                Text(
                  book.subtitle, // Subtitle from controller
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.0),
                Text(
                  'Name: ${book.Name}', // Name from controller
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
                Text(
                  book.book, // Text from controller
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
                Text(
                  'Duration: ${book.duration}', // Duration from controller
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star_half, color: Colors.yellow),
                    SizedBox(width: 8.0),
                    Text(
                      book.rating.toString(), // Rating from controller
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      '(${book.numberOfRatings} ratings)', // Number of ratings from controller
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/audio');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange, // Button color
                      minimumSize: Size(double.infinity, 50), // Full width
                    ),
                    child: Text('Play'),
                  ),
                ),
                SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ElevatedButton(
                    onPressed: controller.download,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFFC107), // Light orange
                      minimumSize: Size(double.infinity, 50), // Full width
                    ),
                    child: Text('Download'),
                  ),
                ),
                SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ElevatedButton(
                    onPressed: controller.addToFavorite,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFFA500), // Dull orange
                      minimumSize: Size(double.infinity, 50), // Full width
                    ),
                    child: Text('Add to Favorite'),
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Summary', // Heading for summary
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.0),
                Text(
                  book.description, // Description from controller
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
                GestureDetector(
                  onTap: controller.readMore,
                  child: Text(
                    'Read More', // Clickable text
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),

                // What Listeners Say Card
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'What Listeners Say',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 20.0),
                            Icon(Icons.star, color: Colors.yellow, size: 20.0),
                            Icon(Icons.star, color: Colors.yellow, size: 20.0),
                            Icon(Icons.star, color: Colors.yellow, size: 20.0),
                            Icon(Icons.star_half, color: Colors.yellow, size: 20.0),
                            SizedBox(width: 8.0),
                            Text(
                              '4.5 (10.0k)',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.star, color: Colors.yellow, size: 20.0),
                                  Text(
                                    'Star Rating',
                                    style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    '4.7',
                                    style: Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ),
                            VerticalDivider(thickness: 2),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.star, color: Colors.yellow, size: 20.0),
                                  Text(
                                    'Performance',
                                    style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    '4.3',
                                    style: Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Add Review Section
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add Review',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: 8.0),
                      Obx(
                            () => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (index) {
                            return IconButton(
                              icon: Icon(Icons.star),
                              color: index < controller.rating.value
                                  ? Colors.yellow
                                  : Colors.grey,
                              onPressed: () {
                                controller.setRating(index + 1);
                              },
                            );
                          }),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      ElevatedButton(
                        onPressed: controller.submitReview,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          minimumSize: Size(double.infinity, 50),
                        ),
                        child: Text('Submit Review'),
                      ),
                    ],
                  ),
                ),
                //SizedBox(height: 8.0),
                SizedBox(height: 8.0),

// New Expanded Card
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Great Resource',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            color: index < 5 ? Colors.yellow : Colors.grey,
                            size: 20.0,
                          );
                        }),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Dr janny: 2 days ago', // Name with upload time
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Thorough understanding of cardiology basics', // Description
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(height: 8.0),
                      GestureDetector(
                        onTap: () {
                          // Implement read more functionality
                        },
                        child: Text(
                          'Read More',
                          style: TextStyle(color: Colors.blue, fontSize: 16.0),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Star Rating: 5.0',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            'Performance: 4.5',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 8.0),

                // Button to See Reviews
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),

                  child: ElevatedButton(
                    onPressed: () {
                      // Implement functionality to see reviews
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange, // Button color
                      minimumSize: Size(double.infinity, 50), // Full width
                    ),
                    child: Text('See Review'),
                  ),
                ),
              ],
            ),
          );
        },
      ),

    );
  }
}
