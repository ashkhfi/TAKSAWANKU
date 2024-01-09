import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ViewMateri extends StatefulWidget {
  final String title;
  final String file;

  const ViewMateri({Key? key, required this.title, required this.file})
      : super(key: key);

  @override
  _ViewPdfState createState() => _ViewPdfState();
}

class _ViewPdfState extends State<ViewMateri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color(0xFFFAEED1),
      ),
      body: Stack(
        children: [
          // Background Container with Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.jpg'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // PDF Viewer
          Padding(
            padding: const EdgeInsets.all(8.0), // Adjust margins as needed
            child: Container(
              height: MediaQuery.of(context).size.height - 300,
              child: SfPdfViewer.asset(
                widget.file,
                pageLayoutMode: PdfPageLayoutMode.continuous,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
