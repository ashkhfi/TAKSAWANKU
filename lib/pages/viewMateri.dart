
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class ViewMateri extends StatefulWidget {
  final String title;
  final String file;

  // Perbaikan: Gunakan 'Key?' untuk memastikan dapat menerima nilai null
  const ViewMateri({Key? key, required this.title, required this.file})
      : super(key: key);


  @override
  State<ViewMateri> createState() => _ViewMateriState();
}

class _ViewMateriState extends State<ViewMateri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text(widget.title)),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(15),
        decoration:  const BoxDecoration(image: DecorationImage(fit: BoxFit.cover,image: AssetImage('assets/bg.jpg'))),
        child:
        SfPdfViewer.asset(
          widget.file,
        ),
      ),);
  }
}
