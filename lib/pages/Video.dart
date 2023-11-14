import 'package:flutter/material.dart';

import 'Video Player.dart';

class Video extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video"),
        centerTitle: true,
      ),
      body: Column(
        // Ganti Expanded dengan Column
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            // Ganti Expanded dengan Column
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 30),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 12,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            ListTile(
                              selected: false,
                              leading: Icon(
                                Icons.video_library_rounded,
                                size: 30,
                                color: Colors.orange,
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
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
