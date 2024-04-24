import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/foundation.dart';

import 'package:classes_app/theme/Color.dart';

class ViewDocument extends StatefulWidget {
  ViewDocument({Key? key, required this.fileUrl, required this.title})
      : super(key: key);

  final String fileUrl, title;

  @override
  _ViewDocumentState createState() => _ViewDocumentState(fileUrl, title);
}

class _ViewDocumentState extends State<ViewDocument> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String TAG = "ViewDocument: ";
  String _fileUrl, _title;

  _ViewDocumentState(this._fileUrl, this._title);

  WebViewController? _controller;

  String documentUrl = "";

  var _isLoading = true;

  bool loadingTypeImage = false;
  File? file;

  @override
  void initState() {
    super.initState();

    /*file = File(_fileUrl);
    file.exists();*/

    print("viewPath:$_fileUrl");

    int lastDot = _fileUrl.lastIndexOf('.', _fileUrl.length - 1);
    if (lastDot != -1) {
      String extension = _fileUrl.substring(lastDot + 1);
      if (extension == "jpg" || extension == "png" || extension == "jpeg") {
        loadingTypeImage = true;
      } else {
        loadingTypeImage = false;
      }
    }
  }

  Future<bool> _refresh() async {
    if (_controller != null) {
      setState(() {
        _isLoading = true;
      });
      // _controller!
      //     .loadUrl("http://docs.google.com/gview?embedded=true&url=$_fileUrl");
    }
    return true;
  }

  TargetPlatform? platform;

  @override
  Widget build(BuildContext context) {
    platform = Theme.of(context).platform;

    return Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text(_title),
        backgroundColor: ColorsInt.colorPrimary,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.refresh,
              color: ColorsInt.colorWhite,
              size: 35,
            ),
            onPressed: () => _refresh(),
          ),
        ],
      ),
      body: loadingTypeImage
          ? new Image.network(_fileUrl)
          : new Stack(
              children: [
                // new WebView(
                //   initialUrl:
                //       "http://docs.google.com/gview?embedded=true&url=$_fileUrl",
                //   javascriptMode: JavascriptMode.unrestricted,
                //   onWebViewCreated: (WebViewController webViewController) {
                //     setState(() {
                //       _controller = webViewController;
                //     });
                //     //_showLoading(context);
                //     print("onWebViewCreated");
                //     setState(() {
                //       _isLoading = true;
                //     });
                //   },
                //   onPageFinished: (String url) {
                //     print("onPageFinished:$url");
                //     setState(() {
                //       _isLoading = false;
                //     });
                //     //_showLoading(context);
                //   },
                // ),
                new Visibility(
                  visible: _isLoading,
                  child: new Center(
                    child: new CircularProgressIndicator(),
                  ),
                ),
              ],
            ),
    );
  }
}
