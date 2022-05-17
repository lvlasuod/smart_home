import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:kf_drawer/kf_drawer.dart';
import 'package:smart_home/ui/class_builder.dart';
import 'package:smart_home/ui/home.dart';
import 'package:smart_home/ui/profile.dart';
import 'package:smart_home/ui/schedules.dart';
import 'package:smart_home/ui/settings.dart';
import 'package:smart_home/ui/stats.dart';

void main() {
  ClassBuilder.registerClasses();
  runApp(MyUI());
}

class MyUI extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MainWidget(),
    );
  }
}

class MainWidget extends StatefulWidget {
  MainWidget({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  late KFDrawerController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: ClassBuilder.fromString('Home'),
      items: [
        KFDrawerItem.initWithPage(
          text: const Text('Home', style: TextStyle(color: Colors.white, fontSize: 18)),
          icon: const Icon(Icons.home, color: Colors.white),
          page: Home(),
        ),
        KFDrawerItem.initWithPage(
          text: const Text(
            'Profile',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: const Icon(Icons.account_box, color: Colors.white),
          page: Profile(),
        ),
        KFDrawerItem.initWithPage(
          text: const Text(
            'Notifications',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: const Icon(Icons.notifications_active, color: Colors.white),
          page: ClassBuilder.fromString('Notifications'),
        ),
        KFDrawerItem.initWithPage(
          text: const Text(
            'Stats',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: const Icon(Icons.trending_up, color: Colors.white),
          page: Stats(),
        ),
        KFDrawerItem.initWithPage(
          text: const Text(
            'Schedules',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: const Icon(Icons.av_timer, color: Colors.white),
          page: Schedules(),
        ),
        KFDrawerItem.initWithPage(
          text: const Text(
            'Settings',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: const Icon(Icons.settings, color: Colors.white),
          page: Settings(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KFDrawer(
        controller: _drawerController,
        header: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: const DecorationImage(
                        image:  AssetImage('assets/images/image.jpg'),
                        fit: BoxFit.cover
                    )
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text('Scarlett Johansson', style: TextStyle(fontSize: 17, color: Colors.white)),
                    SizedBox(height: 2),
                    Text('Actress', style: TextStyle(fontSize: 15, color: Colors.white70)),
                  ],
                )
              ],
            ),
          ),
        ),
        footer: KFDrawerItem(
          text: const Text(
            'Logout',
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color.fromRGBO(32, 90, 217, 1.0), Color.fromRGBO(
                20, 135, 186, 1.0)],
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}

