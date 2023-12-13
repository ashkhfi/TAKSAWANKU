import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroductionScreen(),
    );
  }
}

class IntroductionScreen extends StatelessWidget {
  final pages = [
    PageViewModel(
      title: "Welcome",
      body: "This app has amazing features.",
      image: Center(
        child: Image.asset("assets/welcome.png", height: 175.0),
      ),
    ),
    PageViewModel(
      title: "Easy Navigation",
      body: "Use easy and intuitive navigation.",
      image: Center(
        child: Image.asset("assets/navigation.png", height: 175.0),
      ),
    ),
    PageViewModel(
      title: "Get Started",
      body: "Explore all the features and make the most of this app.",
      image: Center(
        child: Image.asset("assets/get_started.png", height: 175.0),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => IntroViewsFlutter(
          pages,
          showSkipButton: true,
          onTapDoneButton: () {
            // Navigate to the main screen or the next screen after the introduction is completed
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));
          },
          pageButtonTextStyles: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
      ),
      body: Center(
        child: Text("Welcome to My App!"),
      ),
    );
  }
}
