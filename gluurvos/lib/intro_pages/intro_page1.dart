import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});


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
                'Welcome to Gluurvos!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'Georgia',
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF787569),
                )
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Image.asset(
              'assets/gluurvos.png',
              height: 250,
              width: 250,
            ),
          ),
        ],
      )
    );
  }
}