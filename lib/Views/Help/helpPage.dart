import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() => runApp(HelpPage());

class HelpPage extends StatelessWidget {
  final pageDecoration = PageDecoration(
    titleTextStyle: TextStyle(color: Colors.white),
    bodyTextStyle: TextStyle(color: Colors.white),
  );
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: Image.asset("assets/images/POWER_OF_1_SPORT_LO-FF.png"),
        title: "Power of 1 Sports",
        body: "Welcome to Power of 1 Sports",
        decoration: const PageDecoration(
          titleTextStyle: TextStyle(color: Colors.white),
          bodyTextStyle: TextStyle(color: Colors.white),
        ),
      ),
      PageViewModel(
        image: Image.asset("assets/images/hustle_points.png"),
        title: "Hustle Points",
        body:
            "Tap these buttons on the score card screen to track your steals, rebounds,assist, and blocks",
        decoration: const PageDecoration(
          titleTextStyle: TextStyle(color: Colors.white),
          bodyTextStyle: TextStyle(color: Colors.white),
        ),
      ),
      PageViewModel(
        image: Image.asset("assets/images/shooting_points.png"),
        title: "Total points and Shooting Percentage",
        body:
            "Tap these buttons on the right side of the score card screen to track how many points you score in a games",
        decoration: const PageDecoration(
          titleTextStyle: TextStyle(color: Colors.white),
          bodyTextStyle: TextStyle(color: Colors.white),
        ),
      ),
      PageViewModel(
        // image: Image.asset("assets/images/POWER_OF_1_SPORT_LO-FF.png"),
        title: "Report Card",
        body:
            "A final review of total points scored and you will receive your Power of 1 Grade",
        decoration: const PageDecoration(
          titleTextStyle: TextStyle(color: Colors.white),
          bodyTextStyle: TextStyle(color: Colors.white),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
      globalBackgroundColor: Colors.black12,
      dotsDecorator: DotsDecorator(activeColor: Colors.white),
      pages: getPages(),
      done: Text("Exit", style: TextStyle(color: Colors.white)),
      onDone: () {
        Navigator.pushNamed(context, '/playerName');
      },
    ));
  }
}
