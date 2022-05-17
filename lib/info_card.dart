

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InfoCard extends StatelessWidget {
  IconData icon;
  Color iconColor;
  String title,imgPath;
  String value="undefined";
  double padding=0;
  InfoCard({Key? key,required this.icon,required this.imgPath,required this.iconColor,required this.title,required this.value,required this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
        child: SizedBox(
            width:padding !=0 ? MediaQuery.of(context)
                .size
                .width /
                2 -
                padding: MediaQuery.of(context)
                .size
                .width - 22,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(

                  padding: const EdgeInsets.only(left:10.0,top:5,bottom:2),
                  child: Image.asset(imgPath)
                ),
                Padding(
                  padding: const EdgeInsets.only(left:10.0,bottom:5),
                  child: Text(title,
                      style: const TextStyle(
                        color: Colors.white70,
                          fontSize: 15,
                          fontWeight:
                          FontWeight.w300)),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left:13.0,top:5,bottom:15),
                  child: Column(
                    children: [
                      Text(
                          value,
                          style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 20,
                              fontWeight:
                              FontWeight.bold)),
                    ],
                  ),
                ),



              ],
            )));
  }
}
