import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:proworktree/entities/drawer_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../constants.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CONTACT US'),),
      drawer: MyDrawer(),
      body: ContactUsWebView(),
    );
  }
}

class ContactUsWebView extends StatefulWidget {
  @override
  _ContactUsWebViewState createState() => _ContactUsWebViewState();
}

class _ContactUsWebViewState extends State<ContactUsWebView> {
  bool isLoading =true;
  Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          WebView(
            initialUrl: contactUsUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading ? Center( child: CircularProgressIndicator(),)
              : Stack(),
        ],
      ),

    );
  }
}
