import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../generated/assets.dart';

class IsiMateri extends StatelessWidget {
  const IsiMateri({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: Text("Materi"),
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back)),
          ),
          body: Padding(
              padding: EdgeInsets.all(10.0),
              child: ListView(children: [
                Column(
                  children: [
                    Center(
                      child: Text("Pengertian Amphibia", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
                Text(Assets.a,style: TextStyle(letterSpacing: 0.5, wordSpacing: 2.0, ))
              ])),
        ));
  }
}
