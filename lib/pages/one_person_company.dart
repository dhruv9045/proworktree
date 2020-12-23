import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:proworktree/constants.dart';
import 'package:proworktree/entities/drawer_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OnePersonCompany extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ONE PERSON COMPANY'),),
      drawer: MyDrawer(),
      body: OnePersonCompanyWebView(),
    );
  }
}

class OnePersonCompanyWebView extends StatefulWidget {
  @override
  _OnePersonCompanyWebViewState createState() => _OnePersonCompanyWebViewState();
}

class _OnePersonCompanyWebViewState extends State<OnePersonCompanyWebView> {
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
          initialUrl: onePersonCompanyUrl,
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
    );
  }
}
