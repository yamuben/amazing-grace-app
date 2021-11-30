import 'package:flutter/material.dart';

class Aboutus extends StatefulWidget {
  const Aboutus({ Key? key }) : super(key: key);

  @override
  _AboutusState createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("About Us"),
          Icon(Icons.add_box_rounded,size: 35,)
        ],
      )),
      body: Center(
        child:Text("About Us screen",style: TextStyle(fontSize:40)) ,
      ),
    );
  }
}