import 'package:flutter/material.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEDE8D0),
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                'Search across multiple social media apps!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Georgia',
                  fontWeight: FontWeight.bold,
                )
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Image.asset(
              'assets/search.png',
              height: 250,
              width: 250,
            ),
          ),
        ],
      )
    );
  }
}