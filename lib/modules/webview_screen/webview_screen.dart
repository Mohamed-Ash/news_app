import 'package:flutter/material.dart';
class WebViewScreenss extends StatelessWidget {
  final String url;

  const WebViewScreenss({Key? key, required this.url, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Text(url),
      ),
    );
  }
}
