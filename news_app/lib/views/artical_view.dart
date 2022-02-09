import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticalView extends StatefulWidget {
  const ArticalView({Key? key, @required this.Blogurl}) : super(key: key);
  final Blogurl;
  @override
  _ArticalViewState createState() => _ArticalViewState();
}

class _ArticalViewState extends State<ArticalView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("News", style: TextStyle(color: Colors.black)),
            Text(
              "App",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Icon(Icons.save),
            )),
          ),
          Opacity(
            opacity: 0,
            child: Container(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Icon(Icons.save),
            )),
          )
        ],
      ),
      body: Container(
          child: WebView(
        initialUrl: widget.Blogurl,
        onWebViewCreated: ((WebViewController webViewController) =>
            {_completer.complete(webViewController)}),
      )),
    );
  }
}
