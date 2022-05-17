import 'package:flutter/material.dart';
import 'package:smart_home/constant.dart';
import 'package:smart_home/on_boarding/components/content.dart';
import 'package:smart_home/ui/main.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;

  List<Map<String, String>> onBoardingData = [
    {
      "text": "1°step",
      "step":"1",
      "image": "assets/images/s4.png",
      "title": "IoT Coursework 2",
    },
    {
      "text": "2°step",
      "image": "assets/images/s2.png",
      "title": "Access to Everything",
    },
    {
      "text": "3°step",
      "image": "assets/images/s1.png",
      "title": "Smart Home Project",
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: size.height * 0.8,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: onBoardingData.length,
              itemBuilder: (context, index) => Content(
                size: size,
                step: onBoardingData[index]["step"],
                image: onBoardingData[index]["image"],
                text: onBoardingData[index]["text"],
                title: onBoardingData[index]["title"],
              ),
            ),
          ),
          SizedBox(height: size.height * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onBoardingData.length,
              (index) => Container(
                margin: EdgeInsets.only(right: 15),
                height: 13,
                width: 13,
                decoration: BoxDecoration(
                  color: currentPage == index ? Colors.blue : Colors.white,
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.03),
          TextButton(
            onPressed: () { Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) =>  MyUI()),
            ); },
            child: Text(
              "skip",
              style: kDefaultTextStyle.copyWith(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
