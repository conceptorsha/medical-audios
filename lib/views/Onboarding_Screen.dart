import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/content_model.dart'; // Ensure this path is correct

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _goToNextPage() {
    if (_currentIndex < contents.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      Get.toNamed('/welcome'); // Navigate to WelcomeScreen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: contents.length,
            onPageChanged: _onPageChanged,
            itemBuilder: (_, i) {
              return Column(
                children: [
                  // Top half with the image
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5, // 50% of screen height
                    width: double.infinity,
                    child: Image.asset(
                      contents[i].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Bottom half with scrollable content
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              contents[i].title,
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              contents[i].description,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 20), // Space between description and dots
                            // Dots indicator positioned between description and button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                contents.length,
                                    (index) => buildDot(index, context),
                              ),
                            ),
                            SizedBox(height: 20), // Space between dots and button
                            Container(
                              height: 60,
                              width: double.infinity,
                              child: ElevatedButton(
                                child: Text(
                                  _currentIndex == contents.length - 1 ? "Continue" : "Next",
                                ),
                                onPressed: _goToNextPage,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(context).primaryColor,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          // Skip button positioned at the top right
          Positioned(
            top: 40,
            right: 20,
            child: GestureDetector(
              onTap: () {
                Get.toNamed('/welcome'); // Navigate to WelcomeScreen
              },
              child: Text(
                "Skip",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: _currentIndex == index ? 22 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
