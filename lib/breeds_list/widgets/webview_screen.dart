import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final String initialUrl;

  const WebViewScreen({Key? key, required this.initialUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: WebView(
        initialUrl: initialUrl,
      ),
    );
  }
}
