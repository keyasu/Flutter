import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            SizedBox(
              width: 200.0,
              height: 300.0,
              child: Container(
                alignment: Alignment(0, -1),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(3, 54, 255, 1.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(
              height: 32.0,
            ),
            SizedBox(
              width: 100.0,
              height: 100.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(3, 54, 255, 1.0),
                  // borderRadius: BorderRadius.circular(8.0),
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Color.fromRGBO(7, 102, 255, 1.0),
                      Color.fromRGBO(3, 54, 255, 1.0),
                    ],
                  ),
                ),
                child: Icon(
                  Icons.brightness_2,
                  color: Colors.white,
                  size: 32.0,
                ),
              ),
            ),
            Positioned(
              top: 20.0,
              right: 20.0,
              child: Icon(
                Icons.ac_unit,
                color: Colors.white,
                size: 32.0,
              ),
            ),
          ],
        )
        // Icon(
        //   Icons.pool,
        //   size: 64.0,
        // ),
        // Icon(
        //   Icons.beach_access,
        //   size: 94.0,
        // ),
        // Icon(
        //   Icons.airplanemode_active,
        //   size: 64.0,
        // ),
      ],
    );
  }
}

class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;
  IconBadge(
    this.icon, {
    this.size = 32.0,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        icon,
        size: size,
        color: Colors.white,
      ),
      width: size + 60.0,
      height: size + 60.0,
      color: Colors.red,
      // color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}
