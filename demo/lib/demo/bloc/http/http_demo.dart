import 'dart:convert';

import 'package:demo_20210316/demo/state/state_management_demo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HttpDemo extends StatelessWidget {
  const HttpDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpDemo'),
        elevation: 0.0,
      ),
      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  HttpDemoHome({Key key}) : super(key: key);

  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {
  @override
  void initState() {
    super.initState();
    // fetchPosts().then((value) => print(value));

    // final post = {
    //   'title': 'hello ~',
    //   'description': 'nice to meet you.',
    // };
    // print(post['title']);
    // print(post['description']);

    // final postJson = json.encode(post);
    // print(postJson);

    // final postJsonConverted = json.decode(postJson);
    // print(postJsonConverted);
    // print(postJsonConverted is Map);

    // final postModel = Post.fromJson(postJsonConverted);
    // print('title = ${postModel.name}');
    // print('description = ${postModel.id}');

    // print('json = ${json.encode(post)}');

    // print('title=${postModel.title}, description = ${postModel.description');
  }

  Future<List<Post>> fetchPosts() async {
    final url = Uri.parse(
        'https://xiaozhuanlan.com/api/zhuanlans?session_key=96c4e07768cb087da6dacc51443235eead50c085');
    final responseData = await http.get(url);

    // print('response data = ${responseData.statusCode}');
    // print('response body = ${responseData.body}');
    if (responseData.statusCode == 200) {
      final responseBody = json.decode(responseData.body);
      List<Post> posts = responseBody['zhuanlans']
          .map<Post>((item) => Post.fromJson(item))
          .toList();

      return posts;
    } else {
      throw Exception('Failed to fetch Posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchPosts(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print('data: ${snapshot.data}');
        print('connectionState: ${snapshot.connectionState}');
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text('loading'),
          );
        }
        return ListView(
          children: snapshot.data.map<Widget>((Post item) {
            return ListTile(
              title: Text(item.name),
              subtitle: Text('${item.id}'),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(item.logo_url),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class Post {
  final int id;
  final String name;
  final String recommended_reason;
  // final String category;
  final String logo_url;

  Post(
    this.id,
    this.name,
    this.recommended_reason,
    // this.category,
    this.logo_url,
  );

  Post.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        recommended_reason = json['recommended_reason'],
        // category = json['category'],
        logo_url = json['logo_url'];

  Map toJson() => {
        'name': name,
        'recommended_reason': recommended_reason,
      };
}
