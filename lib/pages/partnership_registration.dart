import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:proworktree/constants.dart';
import 'package:proworktree/entities/drawer_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PartnershipRegistration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PARTNERSHIP REGISTRATION'),),
      drawer: MyDrawer(),
      body: PartnershipRegistrationWebView(),
    );
  }
}
class PartnershipRegistrationWebView extends StatefulWidget {
  @override
  _PartnershipRegistrationWebViewState createState() => _PartnershipRegistrationWebViewState();
}

class _PartnershipRegistrationWebViewState extends State<PartnershipRegistrationWebView> {
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
          initialUrl: partnershipRegisterUrl,
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
