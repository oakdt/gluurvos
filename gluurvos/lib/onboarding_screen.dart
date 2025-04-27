import 'package:flutter/material.dart';
import 'package:gluurvos/custom_page_indicator.dart';
import 'package:gluurvos/home_page.dart';
import 'package:gluurvos/intro_pages/intro_page1.dart';
import 'package:gluurvos/intro_pages/intro_page2.dart';
import 'package:gluurvos/intro_pages/intro_page3.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  // controller to keep track of pages
  final PageController _controller = PageController();

  // last page?
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),

          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                //skip
                GestureDetector(
                  child: Text(
                    'skip',
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                  onTap: () {
                    _controller.jumpToPage(2);
                  }
                ),

                // dot indicator
                Container(
                  padding: EdgeInsets.all(8),
                  child: CustomPageIndicator(
                    controller: _controller,
                    count: 3,
                    dotColor: const Color(0xFFC9C5B1),
                    activeDotColor: const Color(0xFF787569),
                  ),
                ),

                // next or done
                onLastPage
                    ? GestureDetector(
                      child: Text(
                        'done',
                        style: TextStyle(
                          fontSize: 18
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return HomePage();
                            },
                          ),
                        );
                      }
                    )
                    : GestureDetector(
                      child: Text(
                        'next',
                        style: TextStyle(
                          fontSize: 18
                        ),
                      ),
                      onTap: () {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 250),
                          curve: Curves.easeIn,
                        );
                      }
                    ),
              ],
            ),
          ),
        ]
      )
    );
  }
}