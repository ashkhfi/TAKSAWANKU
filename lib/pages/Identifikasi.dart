import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class Identifikasi extends StatefulWidget {
  const Identifikasi({Key? key}) : super(key: key);

  @override
  State<Identifikasi> createState() => _IdentifikasiState();
}

class _IdentifikasiState extends State<Identifikasi> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: wv_identifikasi(),
      ),
    );
  }
}

Widget wv_identifikasi(){
  WebViewController? controller;
  controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..clearCache()
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
// Update loading bar.
          Center( child: CircularProgressIndicator(),);
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('http://Amphibiaweb.org')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('http://Amphibiaweb.org'));
  return WebViewWidget(controller: controller);
}