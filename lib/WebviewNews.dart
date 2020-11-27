import 'package:flutter/material.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewNews extends StatefulWidget {
  final String newsurl;
  WebViewNews({this.newsurl});
  @override
  _WebViewNewsState createState() => _WebViewNewsState();
}

class _WebViewNewsState extends State<WebViewNews> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Details"),
      ),
      body: WebView(
      initialUrl: widget.newsurl,
    ),
    );
  }
}
