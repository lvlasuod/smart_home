import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:smart_home/info_card.dart';
import 'package:smart_home/menu_card.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  DatabaseReference dht11tRef = FirebaseDatabase.instance.ref('DHT11/current');
  DatabaseReference lightRef = FirebaseDatabase.instance.ref('Light/current');
  Map<String, dynamic> _light= <String, dynamic>{};
  Map<String, dynamic> _dht11= <String, dynamic>{};
  late StreamSubscription<DatabaseEvent> _dht11Subscription;
  late StreamSubscription<DatabaseEvent> _lightSubscription;


  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    _dht11Subscription = dht11tRef.onValue.listen((DatabaseEvent event) {
      setState(() {
        final data = event.snapshot.value;
        Map<String, dynamic> dht11 = Map<String, dynamic>.from(data as Map);
        _dht11 = dht11;
      });
    }, onError: (Object o) {
      final error = o as FirebaseException;
      setState(() {
        //_error = error;
      });
    });
    _lightSubscription = lightRef.onValue.listen((DatabaseEvent event) {
      setState(() {
        final data = event.snapshot.value;
        Map<String, dynamic> light = Map<String, dynamic>.from(data as Map);
        print(light);
        _light = light;

      });
    }, onError: (Object o) {
      final error = o as FirebaseException;
      setState(() {
        //_error = error;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _dht11Subscription.cancel();
    _lightSubscription.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        leading: Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: Image.asset("assets/illustrated/logo.png",scale: 2,),
        ),
        elevation: 0,
        backgroundColor:const Color(0xff205ad9),
        actions: const [Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(Icons.menu,color: Colors.white,),
        )]
        ,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.fill,



          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left:10.0,top:20),
              child: Row(
                children: const [
                  Text("Active ",style:  TextStyle(
                    color: Colors.white,
                    fontSize: 25
                  ),),
                  Text("Sensors",style:  TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 25
                  ),),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left:10.0),
              child: Text("Total 4 active devices.",style:  TextStyle(
                  color: Colors.white,
                  fontSize: 14
              ),),
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                MenuCard(
                    icon: Icons.ac_unit_sharp,
                    iconColor: Colors.grey,
                    title: "Thermostat",
                    padding: 10.0),
                MenuCard(
                    icon: Icons.lightbulb,
                    iconColor: Colors.grey,
                    title: "Light",
                    padding: 10.0),
                MenuCard(
                    icon: Icons.smoke_free,
                    iconColor: Colors.grey,
                    title: "Smoke",
                    padding: 10.0),
                MenuCard(
                    icon: Icons.accessibility_new,
                    iconColor: Colors.grey,
                    title: "Intrusion",
                    padding: 10.0),

              ],
            ),
            Row(
              children: [
                MenuCard(
                    icon: Icons.ac_unit_sharp,
                    iconColor: Colors.grey,
                    title: "Thermostat",
                    padding: 10.0),
                MenuCard(
                    icon: Icons.lightbulb,
                    iconColor: Colors.grey,
                    title: "Light",
                    padding: 10.0),
                MenuCard(
                    icon: Icons.add,
                    iconColor: Colors.blue,
                    title: "Device",
                    padding: 10.0),

              ],
            ),
            InfoCard(
                imgPath: "assets/illustrated/temp.png",
                icon: Icons.power_rounded,
                iconColor: Colors.red,
                title: "Voltage",
                value: _light.toString(),
                padding: 10.0),
            InfoCard(
                imgPath: "assets/illustrated/temp.png",
                icon: Icons.battery_charging_full_sharp,
                iconColor: Colors.amber,
                title: "Charging status",
                value: _dht11.toString(),
                padding: 26.0),
          ],
        ),
      ),
    );
  }
}
