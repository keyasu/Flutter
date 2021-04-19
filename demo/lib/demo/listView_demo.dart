import 'package:demo_20210316/demo/post_show.dart';
import 'package:flutter/material.dart';
import '../model/post.dart';
import './post_show.dart';
import './page_demo.dart';

class ListViewDemo extends StatelessWidget {
  Widget _listItemBuilder(BuildContext context, int index) {
    return Container(
        color: Colors.white,
        margin: EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Image.network(posts[index].imageUrl),
                SizedBox(height: 16.0),
                Text(
                  posts[index].title,
                  style: Theme.of(context).textTheme.title,
                ),
                Text(
                  posts[index].author,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(height: 16.0),
              ],
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.white.withOpacity(0.3),
                  highlightColor: Colors.white.withOpacity(0.1),
                  onTap: () {
                    debugPrint('tap1');
                    //   MaterialPageRoute(
                    //       builder: (context) => PostShow(post: posts[index]));

                    // },
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostShow(post: posts[index]),
                        ));

                    //
                  },
                ),
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: _listItemBuilder,
    );
  }
}
