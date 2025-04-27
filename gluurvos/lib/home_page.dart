import 'package:flutter/material.dart';
import 'package:gluurvos/search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color (0xFFEDE8D0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset(
                  'assets/gluurvos.png',
                  height: 250,
                  width: 250,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
              
                // search box
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
                  
                  // search field
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search...',

                      // search icon
                      suffixIcon: Icon(
                        Icons.search,
                        color: const Color(0xFF787569),
                        size: 28,
                      ),

                      // invisible search icon with the purpose of centering the text field properly
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.transparent,
                        size: 28,
                      )
                    ),

                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        Navigator.push(
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
      ),
    );
  }
}