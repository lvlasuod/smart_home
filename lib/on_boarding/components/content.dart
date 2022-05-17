import 'package:flutter/material.dart';

import '../../constant.dart';



class Content extends StatelessWidget {
  const Content({
    Key? key,
    required this.size,
    this.text,
    this.image,
    this.title,
    this.step
  }) : super(key: key);

  final Size size;
  final String? text, image, title, step;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.08, vertical: size.height * 0.015),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              step != "1" ? const Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.black38,
              ):Container(),
              Text(
                text!,
                style: kDefaultTextStyle.copyWith(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Image.asset(
            image!,
            //width: double.infinity,
            alignment: Alignment.center,
            fit:BoxFit.fitWidth
          ),
        ),
        SizedBox(height: size.height * 0.03),
        Text(
          title!,
          style: kHeadingTextStyle,
        ),
        Divider(
          thickness: 2.0,
          color: Colors.blue,
          endIndent: size.width * 0.4,
          indent: size.width * 0.4,
        ),
        SizedBox(height: size.height * 0.03),
        Text(
          "You are few click away to enter,\nThe world of Smart Home.",
          textAlign: TextAlign.center,
          style: kDefaultTextStyle.copyWith(fontSize: 18),
        ),
      ],
    );
  }
}
