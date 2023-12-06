import 'package:flutter/material.dart';

import './pages/Beranda.dart';
import './pages/Identifikasi.dart';
import './pages/Test.dart';
import './pages/Video.dart';
import './pages/Materi.dart';
import 'pages/onboarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            fontFamily:
                'Montserrat', // Gunakan nama font yang sesuai dengan yang Anda tentukan di pubspec.yaml
          ),
        ),
      ),
      home: const Onboarding(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(backgroundColor: Colors.grey,),
      body: _selectedIndex == 0
          ? const Beranda()
          : _selectedIndex == 1
              ? const Materi()
              : _selectedIndex == 2
                  ? const Identifikasi()
                  : _selectedIndex == 3
                      ? Video()
                      : _selectedIndex == 4
                          ? const Test()
                          : const Text("data"),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor:  const Color(0xFF1A1A1A),
        unselectedItemColor: Colors.grey[700],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Color(0xFFF7E6C4),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFFF7E6C4),
            icon: Icon(Icons.menu_book),
            label: "Materi",
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFFF7E6C4),
            icon: Icon(Icons.youtube_searched_for),
            label: "Identifikasi",
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFFF7E6C4),
            icon: Icon(Icons.ondemand_video),
            label: "Video",
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFFF7E6C4),
            icon: Icon(Icons.assignment_outlined),
            label: "Test",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
