import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../generated/assets.dart';

class TataTertib extends StatelessWidget {
  const TataTertib({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: Text("Tata Tertib"),
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back, size: 30,)),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(Assets.TataTertip,style: TextStyle(letterSpacing: 1.0, wordSpacing: 2.0, )),
          ),
        ));
  }
}
