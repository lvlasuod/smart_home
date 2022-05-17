import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/my_app.dart';
import 'package:smart_home/on_boarding/on_boarding_screen.dart';
import 'package:smart_home/ui/class_builder.dart';
import 'package:smart_home/ui/main.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  ClassBuilder.registerClasses();
  runApp(const Splash());
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash>{
   @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/splash_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 490,
                ),


                Builder(builder: (context) {
                  return TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) =>  OnBoardingScreen()),
                      );
                    },
                    child: Column(
                      children: [
                        Image.asset("assets/illustrated/logo.png"),
                        const SizedBox(
                          height: 30,
                        ),
                         const Text(
                          "To monitor your home\nGet Started >",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                  );
                }),

                const SizedBox(
                  height: 80,
                ),
                const Text(
                  "mpdev.com v.0.1",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
