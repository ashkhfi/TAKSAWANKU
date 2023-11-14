import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ViewPdf extends StatefulWidget {
  final String title;
  final String file;

  // Perbaikan: Gunakan 'Key?' untuk memastikan dapat menerima nilai null
  const ViewPdf({Key? key, required this.title, required this.file})
      : super(key: key);

  @override
  _ViewPdfState createState() => _ViewPdfState();
}

class _ViewPdfState extends State<ViewPdf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.sizeOf(context).height - 400,
        child: SfPdfViewer.asset(
          widget.file,
        ),
      ),
    );
  }
}
