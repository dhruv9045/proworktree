import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:proworktree/entities/drawer_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../constants.dart';

class CompanyRegistration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('COMPANY REGISTRATION'),),
      drawer: MyDrawer(),
      body: CompanyRegistrationWebView(),
    );
  }
}

class CompanyRegistrationWebView extends StatefulWidget {
  @override
  _CompanyRegistrationWebViewState createState() => _CompanyRegistrationWebViewState();
}

class _CompanyRegistrationWebViewState extends State<CompanyRegistrationWebView> {
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
    return Stack(
      children: [
        WebView(
          initialUrl: companyRegistrationUrl,
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
