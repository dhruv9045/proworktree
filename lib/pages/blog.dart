
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:proworktree/entities/drawer_page.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import '../constants.dart';

class Blog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('BLOG'),),
      drawer: MyDrawer(),
      body: BlogWebView(),
    );
  }
}
class BlogWebView extends StatefulWidget {

  @override
  _BlogWebViewState createState() => _BlogWebViewState();
}

class _BlogWebViewState extends State<BlogWebView> {
  WebViewController _myController;
  bool isLoading = true;
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
    void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();

  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebView(
          initialUrl: blogUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            // _controller.complete(webViewController);
            _myController= webViewController;
          },
          javascriptChannels: <JavascriptChannel>[
            _toasterJavascriptChannel(context),
          ].toSet(),
          navigationDelegate: (NavigationRequest request) {
            print("Loading... ${request.url}");
            if(request.url.startsWith("https")) {
              return NavigationDecision.navigate;
            } else {
              return NavigationDecision.prevent;
            }
          },
          onPageFinished: (finish) {
            setState(() {
              _myController.evaluateJavascript("javascript:(function() { " +
                  "var head = document.getElementsByClassName('nav-wrapper')[0].style.display='none'; " +
                  "})()");
              isLoading = false;
            });
          },
        ),
        isLoading ? Center( child: CircularProgressIndicator(),)
            : Stack(),
      ],
    );
  }
}
JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
  return JavascriptChannel(
      name: 'Toaster',
      onMessageReceived: (JavascriptMessage message) {
        Scaffold.of(context).showSnackBar(
          SnackBar(content: Text(message.message)),
        );
      });
}