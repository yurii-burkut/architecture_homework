import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../breeds_list/models/breed.dart';

class WebViewExample extends StatefulWidget {
  final String wikkipediaUrl;

  const WebViewExample({
    super.key,
    required this.wikkipediaUrl
  });


  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {


  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: widget.wikkipediaUrl,
    );
  }
}
