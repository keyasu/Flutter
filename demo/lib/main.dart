import 'package:demo_20210316/demo/animation/animation_demo.dart';
import 'package:demo_20210316/demo/bloc/bloc_demo.dart';
import 'package:demo_20210316/demo/bloc/http/http_demo.dart';
import 'package:demo_20210316/demo/i18n/i18n_demo.dart';
import 'package:demo_20210316/demo/post_show.dart';
import 'package:demo_20210316/demo/rxdart/rxdart_demo.dart';
import 'package:demo_20210316/demo/stream/stream_demo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'demo/drawer_demo.dart';
import 'demo/bottom_navidation_bar_demo.dart';
import './demo/listView_demo.dart';
import './demo/basic_demo.dart';
import './demo/layout_demo.dart';
import './demo/view_demo.dart';
import './demo/sliver_demo.dart';
import './demo/navigator_demo.dart';
import './demo/page_demo.dart';
import './demo/form_demo.dart';
import './demo/material_components.dart';
import './demo/state/state_management_demo.dart';
import './demo/stream/stream_demo.dart';
import './demo/rxdart/rxdart_demo.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './demo/i18n/map/keya_demo_localzations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      // locale: Locale('en', 'US'),
      locale: Locale('zh', 'CN'),
      // localeListResolutionCallback:
      //     (Locale locale, Iterable<Locale> supportLocale) {
      //   return Locale('en', 'US');
      // },
      localizationsDelegates: [
        KeyaDemoLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'),
        Locale('zh', "CH"),
      ],
      debugShowCheckedModeBanner: true,
      title: 'Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white70,
        accentColor: Color.fromRGBO(3, 54, 255, 1.0),
      ),

      // home: Home(),
      // home: NavigatorDemo(),
      initialRoute: '/i18n',
      routes: {
        '/': (context) => Home(),
        '/about': (context) => PagePage(title: "about"),
        '/form': (context) => FormDemo(),
        '/mdc': (context) => MaterialComponents(),
        '/state-management': (context) => StateManagementDemo(),
        '/stream': (context) => StreamDemo(),
        '/rxdart': (context) => RxDartDemo(),
        '/bloc': (context) => BlocDemo(),
        '/http': (context) => HttpDemo(),
        '/animation': (context) => AnimationDemo(),
        '/i18n': (context) => I18nDemo(),
      },
    );
    return materialApp;
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            // leading: IconButton(
            //     icon: Icon(Icons.menu),
            //     onPressed: () => print("menu button is pressed")),
            title: Text('nihao'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () => print('search button is pressed'),
              ),
            ],
            elevation: 0.0,
            bottom: TabBar(
                unselectedLabelColor: Colors.black38,
                indicatorColor: Colors.black54,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 1.0,
                tabs: <Widget>[
                  // ListViewDemo(),
                  Tab(icon: Icon(Icons.local_activity_rounded)),
                  Tab(icon: Icon(Icons.local_activity_rounded)),
                  Tab(icon: Icon(Icons.local_bar_outlined)),
                  Tab(icon: Icon(Icons.view_quilt)),
                ]),
          ),
          body: TabBarView(children: <Widget>[
            ListViewDemo(),
            BasicDemo(),
            LayoutDemo(),
            // ViewDemo(),
            SliverDemo(),
            // Icon(Icons.local_florist, size: 128.0, color: Colors.black12),
            // Icon(Icons.local_activity_rounded,
            //     size: 128.0, color: Colors.black12),
            // Icon(Icons.bike_scooter, size: 128.0, color: Colors.black12),
          ]),
          drawer: DrawerDemo(),
          bottomNavigationBar: BottomNavidationBarDemo(),
        ));
  }
}
