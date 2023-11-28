import 'package:flutter/material.dart';

import 'Video Player.dart';

class Video extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title:  Text(
          "Video",
          style: TextStyle(color:Colors.grey[700]),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFFFF6DC),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/bg.jpg'), // Ganti dengan path gambar latar belakang Anda
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            
            children: [
              Card(
                child: ListTile(
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  tileColor:  Color(0xFFFAEED1),
                  selected: false,
                  leading: Icon(
                    Icons.video_library_rounded,
                    size: 30,
                  ),
                  title: const Text(
                    "Amphibi",
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) =>
                              VideoPlayerDialog());
                    },
                    icon: const Icon(Icons.play_arrow_rounded),
                    iconSize: 40.0,
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
