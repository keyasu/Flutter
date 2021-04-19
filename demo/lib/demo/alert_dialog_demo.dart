import 'package:flutter/material.dart';
import 'dart:async';

enum Action {
  OK,
  Cancel,
}

class OpenAliertDialogDemo extends StatefulWidget {
  @override
  _OpenAliertDialogDemoState createState() => _OpenAliertDialogDemoState();
}

class _OpenAliertDialogDemoState extends State<OpenAliertDialogDemo> {
  String _choice = 'Nothing';
  Future _openAlertDialog() async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog'),
          content: Text('Are Youe sure about this?'),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context, Action.Cancel);
              },
              child: Text('Cancel'),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context, Action.OK);
              },
              child: Text('Ok'),
            ),
          ],
        );
      },
    );

    switch (action) {
      case Action.OK:
        setState(() {
          _choice = "OK";
        });
        break;
      case Action.Cancel:
        setState(() {
          _choice = "Cancel";
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Dialog'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('your choice is: $_choice'),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Open DialogDemo'),
                  onPressed: _openAlertDialog,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
