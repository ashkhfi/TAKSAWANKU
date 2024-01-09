import 'package:flutter/material.dart';
import 'package:taskwanku1/model/videoModel.dart';

import 'Video Player.dart';

class Video extends StatefulWidget {
  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
   final List<VideoModel> daftarVideo = [
    VideoModel(
        name: 'All About Amphibians', id: 'YM9ZytyxYBU'),
    VideoModel(
        name: 'Characteristics of Amphibians', id: 'AKN0Z1rIcMo'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title:  Text(
          "Video",
          style: TextStyle(color:Colors.grey[700]),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFFAEED1),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
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
              for (var video in daftarVideo)
                Card(
                  child: ListTile(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    tileColor: const Color(0xFFFAEED1),
                    selected: false,
                    leading: const Icon(
                      Icons.video_library_rounded,
                      size: 30,
                    ),
                    title: Text(
                      video.name,
                      style: const TextStyle(fontSize: 20),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        // Menampilkan dialog pemutaran video sesuai dengan ID video
                        showDialog(
                          context: context,
                          builder: (context) => VideoPlayerDialog(youtubeId: video.id),
                        );
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
