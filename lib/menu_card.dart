

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MenuCard extends StatelessWidget {
  IconData icon;
  Color iconColor;
  String title="undefined";
  double padding=0;
  MenuCard({Key? key,required this.icon,required this.iconColor,required this.title,required this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Card(
          child: SizedBox(
              width:padding !=0 ? MediaQuery.of(context)
                  .size
                  .width /
                  4 -
                  padding: MediaQuery.of(context)
                  .size
                  .width /4,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(

                    padding: const EdgeInsets.only(left:5.0,top:5,bottom:2),
                    child: Icon(icon,
                        size: 30,
                        color: iconColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:5.0,bottom:5),
                    child: Text(title,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight:
                            FontWeight.w300)),
                  ),


                ],
              ))),
    );
  }
}
