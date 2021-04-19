import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo extends StatelessWidget {
  const StreamDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
        elevation: 0.0,
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _streamDemoSubscription;
  StreamController<String> _streamDemo;

  StreamSink _sinkDemo;
  String _data = "...";

  @override
  void dispose() {
    _streamDemo.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    print("creat a stream.");
    // Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    _streamDemo = StreamController.broadcast();
    _sinkDemo = _streamDemo.sink;

    print("start lisence on a stream");

    _streamDemoSubscription =
        _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);
    _streamDemoSubscription =
        _streamDemo.stream.listen(onDataTwo, onError: onError, onDone: onDone);
    print('Initiaize complate');
  }

  void onError(error) {
    print('error $error');
  }

  void onDone() {
    print('Done');
  }

  void onData(String data) {
    print('$data');
    setState(() {
      _data = data;
    });
  }

  void onDataTwo(String data) {
    print('two = $data');
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    // throw 'sonmething happened';
    return 'Hello ~';
  }

  void _pauseStream() {
    print('pause Subcripution');
    _streamDemoSubscription.pause();
  }

  void _resumeStream() {
    print('resume Subcripution');
    _streamDemoSubscription.resume();
  }

  void _cancelStream() {
    print('cance subcripution');
    _streamDemoSubscription.cancel();
  }

  void _addDataToStream() async {
    print('Add data to Stream');
    String data = await fetchData();

    // _streamDemo.add(data);
    _sinkDemo.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(_data),
            StreamBuilder(
              stream: _streamDemo.stream,
              initialData: '...',
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Text('${snapshot.data}');
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(onPressed: _addDataToStream, child: Text('Add')),
                FlatButton(onPressed: _pauseStream, child: Text('pause')),
                FlatButton(onPressed: _resumeStream, child: Text('resume')),
                FlatButton(onPressed: _cancelStream, child: Text('cancel')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
