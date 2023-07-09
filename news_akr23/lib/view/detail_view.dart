import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class DetailViewScreen extends StatefulWidget {
  final String newsUrl;

  DetailViewScreen({required this.newsUrl});

  @override
  State<DetailViewScreen> createState() => _DetailViewScreenState();
}

class _DetailViewScreenState extends State<DetailViewScreen> {
  InAppWebViewController? _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Padding(
        padding: const EdgeInsets.only(right: 35),
        child: Center(child: Text("Detailed News")),
      )),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(widget.newsUrl)),
        onWebViewCreated: (controller) {
          _webViewController = controller;
        },
      ),
    );
  }
}
