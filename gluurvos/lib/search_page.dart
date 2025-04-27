import 'package:flutter/material.dart';
import 'package:gluurvos/search_results.dart';

class ResultsPage extends StatelessWidget {
  final String searchQuery;

  const ResultsPage({
    super.key,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFEDE8D0),
        child: Stack(
          children: [
            // Back button at the top
            Positioned(
              top: 40,
              left: 10,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: const Color(0xFF787569),
                  size: 28,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            // Results area
            SocialMediaResults(searchQuery: searchQuery),

            // Search bar at bottom
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Container(
                height: 75,
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFC9C5B1),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x40000000),
                      blurRadius: 15,
                      spreadRadius: 1,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: TextEditingController(text: searchQuery),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search...',
                    suffixIcon: Icon(
                      Icons.search,
                      color: const Color(0xFF787569),
                      size: 28,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.transparent,
                      size: 28,
                    ),
                  ),
                  onSubmitted: (value) {
                    if (value.isNotEmpty && value != searchQuery) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultsPage(
                            searchQuery: value,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}