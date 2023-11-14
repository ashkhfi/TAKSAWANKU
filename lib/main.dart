
import 'package:flutter/material.dart';

import './pages/Beranda.dart';
import './pages/Identifikasi.dart';
import './pages/Test.dart';
import './pages/Video.dart';
import './pages/Materi.dart';


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
      home: MyHomePage(),
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(backgroundColor: Colors.grey,),
        body: _selectedIndex == 0
            ?  const Beranda()
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
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Beranda",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book),
              label: "Materi",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.youtube_searched_for),
              label: "Identifikasi",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ondemand_video),
              label: "Video",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_outlined),
              label: "Test",
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
