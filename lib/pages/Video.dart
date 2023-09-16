import 'package:flutter/material.dart';

import 'Video Player.dart';

class Video extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      // Ganti Expanded dengan Column
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
          child: Container(
            width: double.maxFinite,
            height: 70.0,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: const Center(
                child: Text(
              "Video",
              style: TextStyle(fontSize: 30, color: Colors.orange),
            )),
          ),
        ),
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
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 10,
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
                                String asset = "assets/google.mp4";
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
    );
  }
}
