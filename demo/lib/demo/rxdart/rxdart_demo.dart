import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxDartDemo extends StatelessWidget {
  const RxDartDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDartDemo'),
        elevation: 0.0,
      ),
      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  RxDartDemoHome({Key key}) : super(key: key);

  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  PublishSubject<String> _textFieldSubject;

  @override
  void initState() {
    super.initState();

    _textFieldSubject = PublishSubject<String>();

    _textFieldSubject
        // .map((event) => 'item: $event')
        // .where((event) => event.length > 9)
        // .debounce(Duration(milliseconds: 500))
        .debounce((event) => null)
        .listen((value) => print(value));

    // Observable<String> _observable =
    //     Observable(Stream.fromIterable(['Hello', '你好', 'Keya']));

    // _observable.listen(print);
    //
    Stream.fromIterable(['Hello', '你好', 'Keya'])
        .throttleTime(Duration(seconds: 1))
        .listen(print);

    Stream.fromIterable([1, 2, 3])
        .throttleTime(Duration(seconds: 1))
        .listen(print); // prints
    PublishSubject<String> _subject = PublishSubject<String>();
  }

  @override
  void dispose() {
    super.dispose();

    _textFieldSubject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: Colors.black),
      child: TextField(
        onChanged: (value) {
          _textFieldSubject.add('input $value');
        },
        onSubmitted: (value) {
          _textFieldSubject.add('sumit $value');
        },
        decoration: InputDecoration(
          labelText: 'title',
          filled: true,
        ),
      ),
    );
  }
}
