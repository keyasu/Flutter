import 'package:flutter/material.dart';

class FloatingButtonActionButtonDemo extends StatelessWidget {
  final Widget _floatingActionButton = FloatingActionButton(
    onPressed: () {
      // Navigator.of(context).pop();
    },
    child: Icon(Icons.add),
    elevation: 0.0,
    backgroundColor: Colors.black87,
    shape: BeveledRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
  );

  final Widget _floatingActionButtonExtened = FloatingActionButton.extended(
    onPressed: () {},
    label: Text('Add'),
    icon: Icon(Icons.add),
    backgroundColor: Colors.black87,
    // shape: BeveledReactangleBeBrode,
    shape: BeveledRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
  );
  // extendedonPressed: (){}, label: Text('add'),);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingButtonActionButtonDemo'),
        elevation: 0.0,
      ),
      floatingActionButton: _floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80.0,
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}
