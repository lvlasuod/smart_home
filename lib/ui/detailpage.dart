import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final imgPath;
  late Map<String, dynamic> dht11;
  late Map<String, dynamic> smoke;
   DetailPage({Key? key, this.imgPath,required this.dht11,required this.smoke}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  bool tempValue = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.imgPath), fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const Spacer(),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/image.jpg'),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(width: 15)
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 340,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Color.fromRGBO(32, 90, 217, 1.0),
              ),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      listItemStats('assets/images/creative.png',"6 Lights",true),
                      listItemStats('assets/images/air-conditioner.png',"Air Conditioner", false),
                      listItemStats('assets/images/washing-machine.png',"Washing Machine", false)
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Divider(color: Colors.white,)
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children:  <Widget>[
                        const Text("Temperature", style: TextStyle(color: Colors.white),),
                        const Spacer(),
                        Text(widget.dht11["Temperature"].toString()+" °C", style: const TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: <Widget>[
                        const Text("Humidity", style: TextStyle(color: Colors.white),),
                        const Spacer(),
                        Text(widget.dht11["Humidity"].toString()+"%", style: const TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: <Widget>[
                        const Text("Smoke Level", style: const TextStyle(color: Colors.white),),
                        const Spacer(),
                        Text(widget.smoke["Smoke"].toString(), style: const TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                      child: Divider(color: Colors.white,)
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    child: Row(
                      children: <Widget>[
                        const Text("Day Schedule", style: TextStyle(color: Colors.white),),
                        const Spacer(),
                        Switch(
                          value: tempValue,
                          onChanged: (newVal){
                            setState(() {
                              tempValue = newVal;
                              print(newVal);
                            });
                          },
                          activeColor: Colors.blue,
                        )
                      ],
                    ),
                  ),
                ],
              )
            ),
          )
        ],
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
            activeColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
