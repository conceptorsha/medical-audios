import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../nav_bar/navigation_bar.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 3;

  @override
  void initState() {
    super.initState();
    // Initialize any data if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Profile')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Profile Image, Name, and Number
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/doc2.jpeg'), // Replace with your image path
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children
                            : [
                          Text(
                            'John Doe', // Replace with user's name
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '+1234567890', // Replace with user's number
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Logout Button
                  ElevatedButton(
                    onPressed: () {
                      // Add your logout functionality here
                    },
                    child: Text('Logout'),
                    style: ElevatedButton.styleFrom(
                     // primary: Colors.red, // Button color
                    ),
                  ),
                ],
              ),
            ),
            Divider(), // Adds a separator line
            // Scrollable List of Items
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Account'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Get.toNamed('/account'); // Navigate to WelcomeScreen
                // Handle Account tap
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Address'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Get.toNamed('/welcome'); // Navigate to WelcomeScreen
                // Handle Address tap
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Your Favorite'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                // Handle Your Favorite tap
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('History'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                // Handle History tap
              },
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Payment'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                // Handle Payment tap
              },
            ),
            ListTile(
              leading: Icon(Icons.help_center),
              title: Text('Help Center'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                // Handle Help Center tap
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            // Add navigation logic here if needed
          });
        },
      ),
    );
  }
}
