import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:proworktree/constants.dart';
import 'package:proworktree/entities/drawer_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ProprietorshipRegistration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PROPRIETORSHIP REGISTRATION'),),
      drawer: MyDrawer(),
      body: ProprietorshipRegistrationWebView(),
    );
  }
}
class ProprietorshipRegistrationWebView extends StatefulWidget {
  @override
  _ProprietorshipRegistrationWebViewState createState() => _ProprietorshipRegistrationWebViewState();
}

class _ProprietorshipRegistrationWebViewState extends State<ProprietorshipRegistrationWebView> {
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
          initialUrl: proprietorshipUrl,
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
