import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  // ChipDemo({Key key}) : super(key: key);

  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tags = [
    'Apple',
    'Banana',
    'Lemon',
  ];
  String _action = "Nothing";
  List<String> _selected = [];
  String _choice = 'Lemon';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemoq'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              // mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8.0,
              runSpacing: 16.0,
              children: <Widget>[
                Chip(
                  label: Text('left'),
                ),
                // SizedBox(width: 8.0),
                Chip(
                  label: Text('Sunset'),
                  backgroundColor: Colors.orange,
                ),
                // SizedBox(width: 8.0),
                Chip(
                  label: Text('Keya'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text("郑"),
                  ),
                ),
                Chip(
                  label: Text('Keya'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text("郑"),
                  ),
                ),
                Chip(
                  label: Text('Keya'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text("郑"),
                  ),
                ),
                Chip(
                  label: Text('Keya'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text("郑"),
                  ),
                ),
                // SizedBox(width: 18.0),
                Chip(
                  label: Text('Keyasu'),
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://img0.baidu.com/it/u=3155998395,3600507640&fm=26&fmt=auto&gp=0.jpg"),
                    child: Text("郑"),
                  ),
                ),
                Chip(
                  label: Text('City'),
                  deleteIcon: Icon(Icons.delete),
                  deleteIconColor: Colors.redAccent,
                  deleteButtonTooltipMessage: 'Remove this tag',
                  onDeleted: () {},
                ),
                Divider(
                  color: Colors.grey,
                  height: 32.0,
                  indent: 21.0,
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return Chip(
                      label: Text(tag),
                      onDeleted: () {
                        setState(() {
                          _tags.remove(tag);
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  color: Colors.grey,
                  height: 32.0,
                  indent: 21.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text("ActionChip: $_action"),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return ActionChip(
                      label: Text(tag),
                      onPressed: () {
                        setState(() {
                          _action = tag;
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  color: Colors.grey,
                  height: 32.0,
                  indent: 21.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text("FilterChip: ${_selected.toString()}"),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return FilterChip(
                      label: Text(tag),
                      selected: _selected.contains(tag),
                      onSelected: (value) {
                        setState(() {
                          if (_selected.contains(tag)) {
                            _selected.remove(tag);
                          } else {
                            _selected.add(tag);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  color: Colors.grey,
                  height: 32.0,
                  indent: 21.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text("ChoiceChip: $_choice"),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return ChoiceChip(
                      label: Text(tag),
                      selected: _choice == tag,
                      selectedColor: Colors.black,
                      onSelected: (value) {
                        setState(() {
                          _choice = tag;
                        });
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: () {
          setState(() {
            _tags = ['Apple', 'bBnana', 'Lemon'];
            _selected = [];
            _choice = "Lemon";
          });
        },
      ),
    );
  }
}
