import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

class AddLinkWidget extends StatefulWidget {
  @override
  _AddLinkWidgetState createState() => new _AddLinkWidgetState();
}

class _AddLinkWidgetState extends State<AddLinkWidget> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  void _completeLinkGrabbing(
      AsyncSnapshot<WebViewController> controller) async {
    var url = await controller.data.currentUrl();
    print(controller.data.currentUrl());
    Navigator.of(context).pop(url);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SafeArea(
          child: WebView(
        initialUrl: "https://google.de",
        onWebViewCreated: (WebViewController c) {
          _controller.complete(c);
        },
        javascriptMode: JavascriptMode.unrestricted,
      )),
      floatingActionButton: FutureBuilder<WebViewController>(
          future: _controller.future,
          builder: (BuildContext context,
              AsyncSnapshot<WebViewController> controller) {
            if (controller.hasData) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: FloatingActionButton(
                  child: Icon(Icons.check),
                  onPressed: () => _completeLinkGrabbing(controller),
                ),
              );
            }
            return Container();
          }),
    );
  }
}
