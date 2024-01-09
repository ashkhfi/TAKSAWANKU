import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ViewMateri extends StatefulWidget {
  final String title;
  final String file;

  // Perbaikan: Gunakan 'Key?' untuk memastikan dapat menerima nilai null
  const ViewMateri({Key? key, required this.title, required this.file})
      : super(key: key);

  @override
  _ViewPdfState createState() => _ViewPdfState();
}

class _ViewPdfState extends State<ViewMateri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),
      backgroundColor: const Color(0xFFFAEED1),),
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.sizeOf(context).height - 300,
        child: SfPdfViewer.asset(
          widget.file,
          pageLayoutMode: PdfPageLayoutMode.continuous,
        ),
      ),
    );
  }
}