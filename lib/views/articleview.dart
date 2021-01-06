import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArcticleView extends StatefulWidget {
  final String blogUrl;
  ArcticleView({this.blogUrl});
  @override
  _ArcticleViewState createState() => _ArcticleViewState();
}

class _ArcticleViewState extends State<ArcticleView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Flutter'),
            Text(
              'News',
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        actions: [
          Opacity(opacity:0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.save),
          ),)
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.blogUrl,
          onWebViewCreated: ((WebViewController WebViewController) {
            _completer.complete(WebViewController);
          }),
        ),
      ),
    );
  }
}
