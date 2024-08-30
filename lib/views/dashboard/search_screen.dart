import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../nav_bar/navigation_bar.dart';

class SearchController extends GetxController {
  var recentSearches = <String>[].obs;
  var searchText = ''.obs;

  void addSearch(String query) {
    if (query.isNotEmpty && !recentSearches.contains(query)) {
      recentSearches.add(query);
    }
  }

  void clearSearch() {
    searchText.value = '';
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchController searchController = Get.put(SearchController());
  int _selectedIndex = 2;

  @override
  void initState() {
    super.initState();
    // Initialize any data if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) {
                searchController.searchText.value = value;
              },
              onSubmitted: (value) {
                searchController.addSearch(value);
              },
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 24.0),
            Text(
              'Recent Searches',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12.0),
            Expanded(
              child: Obx(
                    () => searchController.recentSearches.isEmpty
                    ? Center(child: Text('No recent searches'))
                    : ListView.builder(
                  itemCount: searchController.recentSearches.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(searchController.recentSearches[index]),
                    );
                  },
                ),
              ),
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
