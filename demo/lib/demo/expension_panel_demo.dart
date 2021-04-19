import 'package:flutter/material.dart';

class ExpansionPanelItem {
  final String headerText;
  final Widget body;
  bool isExpanded;

  ExpansionPanelItem({
    this.headerText,
    this.body,
    this.isExpanded,
  });
}

class ExpensionPanelDemo extends StatefulWidget {
  @override
  _ExpensionPanelDemoState createState() => _ExpensionPanelDemoState();
}

class _ExpensionPanelDemoState extends State<ExpensionPanelDemo> {
  // bool _isExpanded = false;
  List<ExpansionPanelItem> _expandedPanelItems;

  @override
  void initState() {
    super.initState();
    _expandedPanelItems = <ExpansionPanelItem>[
      ExpansionPanelItem(
        headerText: "Panel A",
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text("Content of Panel A"),
        ),
        isExpanded: false,
      ),
      ExpansionPanelItem(
        headerText: "Panel B",
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text("Content of Panel B"),
        ),
        isExpanded: false,
      ),
      ExpansionPanelItem(
        headerText: "Panel C",
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text("Content of Panel C"),
        ),
        isExpanded: true,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expension Panel Demo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ExpansionPanelList(
              expansionCallback: (int idx, bool isExpan) {
                print(idx);
                print(isExpan ? "打开" : "关闭");
                setState(() {
                  _expandedPanelItems[idx].isExpanded = !isExpan;
                });
              },
              children: _expandedPanelItems.map((ExpansionPanelItem item) {
                return ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpan) {
                      return Container(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          item.headerText,
                          style: Theme.of(context).textTheme.title,
                        ),
                      );
                    },
                    body: item.body,
                    isExpanded: item.isExpanded);
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
