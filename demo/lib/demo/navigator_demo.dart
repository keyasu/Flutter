import 'package:flutter/material.dart';

class NavigatorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: null,
              child: Text(
                "Home",
              ),
            ),
            FlatButton(
              child: Text("About"),
              onPressed: () {
                Navigator.pushNamed(context, '/about');
                // Navigator.of(context).push(

                // MaterialPageRoute(
                //   builder: (BuildContext contest) => Page(
                //     title: "About",
                //   ),
                // ),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
