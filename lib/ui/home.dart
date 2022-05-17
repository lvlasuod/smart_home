import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:smart_home/info_card.dart';

import 'detailpage.dart';

class Home extends KFDrawerContent {
  Home({
    Key? key,
  });

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DatabaseReference dht11tRef = FirebaseDatabase.instance.ref('DHT11/current');
  DatabaseReference lightRef = FirebaseDatabase.instance.ref('Light/current');
  DatabaseReference intrusionRef = FirebaseDatabase.instance.ref('intrusion/current');
  DatabaseReference smokeRef = FirebaseDatabase.instance.ref('smoke/current');

  Map<String, dynamic> _light= <String, dynamic>{};
  Map<String, dynamic> _dht11= <String, dynamic>{};
  Map<String, dynamic> _intrusion= <String, dynamic>{};
  Map<String, dynamic> _smoke= <String, dynamic>{};
  late StreamSubscription<DatabaseEvent> _dht11Subscription;
  late StreamSubscription<DatabaseEvent> _lightSubscription;
  late StreamSubscription<DatabaseEvent> _intrusionSubscription;
  late StreamSubscription<DatabaseEvent> _smokeSubscription;


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
    _intrusionSubscription = intrusionRef.onValue.listen((DatabaseEvent event) {
      setState(() {
        final data = event.snapshot.value;
        Map<String, dynamic> intrusion = Map<String, dynamic>.from(data as Map);
        _intrusion = intrusion;
        _checkIfIntrusion(_intrusion["intrusion_alert"]);

      });
    }, onError: (Object o) {
      final error = o as FirebaseException;
      setState(() {
        //_error = error;
      });
    });
    _smokeSubscription = smokeRef.onValue.listen((DatabaseEvent event) {
      setState(() {
        final data = event.snapshot.value;
        Map<String, dynamic> smoke = Map<String, dynamic>.from(data as Map);

        _smoke = smoke;
      });
    }, onError: (Object o) {
      final error = o as FirebaseException;
      setState(() {
        //_error = error;
      });
    });
  }
  _checkIfIntrusion(var value) async {
    // the method below returns a Future
    if (value == 1) {
      _showAlert(context);
    }

  }

  @override
  void dispose() {
    super.dispose();
    _dht11Subscription.cancel();
    _lightSubscription.cancel();
    _smokeSubscription.cancel();
    _intrusionSubscription.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                    child: Material(
                      shadowColor: Colors.transparent,
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: widget.onMenuPressed,
                        child: Padding(
                          padding: const EdgeInsets.only(top:8.0,left:15),
                          child: Image.asset("assets/images/menu.png"),
                        ),
                      ),
                    ),
                  ),

                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0,left:15),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                              image:  AssetImage('assets/images/image.jpg'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  const SizedBox(width: 15)
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: const <Widget>[
                        Text("Welcome", style: TextStyle(fontSize: 17)),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Text("Scarlett Johansson", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 15),
                    const Text("Hey, Scarlett we allow you to handle your electronics from in or outside your house."
                        " We recommend you to please read the instructions carefully and enjoy the luxury.", style: TextStyle(color: Colors.grey),),
                    const SizedBox(height: 30),
                    const Text("Living Room", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 15),
                    Container(
                      height: 300,
                      width: double.infinity,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          listItem('assets/images/living.webp',InfoCard(
                              imgPath: "assets/illustrated/temp.png",
                              icon: Icons.battery_charging_full_sharp,
                              iconColor: Colors.amber,
                              title: "Thermostat",
                              value: _dht11.toString(),
                              padding: 26.0),),
                          const SizedBox(width: 15),
                          listItem('assets/images/bedroom.webp',InfoCard(
                              imgPath: "assets/illustrated/light.png",
                              icon: Icons.battery_charging_full_sharp,
                              iconColor: Colors.amber,
                              title: "Light",
                              value: _light.toString(),
                              padding: 26.0),),
                          const SizedBox(width: 15),
                          listItem('assets/images/picture1.jpg',InfoCard(
                              imgPath: "assets/illustrated/light.png",
                              icon: Icons.battery_charging_full_sharp,
                              iconColor: Colors.amber,
                              title: "Charging status",
                              value: _light.toString(),
                              padding: 26.0),),
                        ],
                      )
                    ),
                    const SizedBox(height: 15),
                    const Text("Dashboard", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Color.fromRGBO(32, 90, 217, 1.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    listItemStats('assets/images/creative.png',"6 Lights",true),
                    listItemStats('assets/images/air-conditioner.png',"Air Conditioner", false),
                    listItemStats('assets/images/washing-machine.png',"Washing Machine", false)
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget listItem(String imgpath, Widget widget){
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailPage(
                imgPath: imgpath,
              dht11: _dht11,
              smoke: _smoke,
                )));
      },
      child: Container(
        width: 325,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(image: AssetImage(imgpath),
          fit: BoxFit.cover
          ),
        ),
        //child:widget
      ),
    );
  }

  Widget listItemStats(String imgpath, String name, bool value){
    return Container(
      width: 110,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: value == true ? Colors.white : const Color.fromRGBO(20, 135, 186, 1.0)
      ),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          Image(image: AssetImage(imgpath),width: 45,height: 45, color: value == true ? Colors.black : Colors.white),
          const SizedBox(height: 15),
          Text(name, style: TextStyle(fontSize: 13, color: value == true ? Colors.black : Colors.white)),
          const SizedBox(height: 5),
          Switch(
            value: value,
            onChanged: (newVal){
              setState(() {
                value = newVal;
                print(newVal);
              });
            },
            activeColor: Colors.lightBlue,
          )
        ],
      ),
    );
  }
  void _showAlert(BuildContext context) {
    // set up the buttons
    Widget remindButton = TextButton(
      child: const Text("Ignore"),
      onPressed:  () {},
    );
    Widget cancelButton = TextButton(
      child: const Text("Security Alert"),
      onPressed:  () {},
    );
    Widget launchButton = const TextButton(
      child: Text("Launch missile"),
      onPressed:  null,
    );
    showDialog(
        context: context,
        builder: (context) =>  AlertDialog(
          title: Column(
            children: const [
              Icon(Icons.dangerous,size: 100,color: Colors.red,),
              Text("Intrusion Detected"),
            ],
          ),
          content: const Text("Individual nonnative entered the house."),
          actions: [
            remindButton,
            cancelButton,
            launchButton,
          ],
        )
    );
  }
}
