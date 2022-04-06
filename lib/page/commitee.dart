import 'dart:convert';

import 'package:amazing_app.v1/data/committee.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Commitee extends StatefulWidget {
  const Commitee({Key? key}) : super(key: key);

  @override
  _CommiteeState createState() => _CommiteeState();
}

class _CommiteeState extends State<Commitee> {
  List<dynamic> committeeDeparts = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString("assets/profile.json");
    final data = await json.decode(response);

    setState(() {
      committeeDeparts = data.map((data) => Committee.fromJson(data)).toList();
    });
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:Colors.grey,

      appBar: AppBar(title: Text("Amazing Grace Commitee")),
      body: GridView.count(
        padding: const EdgeInsets.fromLTRB(2, 15, 2, 0),
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        mainAxisSpacing: 10,

        // Generate 100 widgets that display their index in the List.
        children: List.generate(committeeDeparts.length, (index) {
          return new GestureDetector(
              onTap: () {
                print(committeeDeparts[index].title);
              },
              child: Container(
                  width: 250,
                  height: 65,
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 2,
                            spreadRadius: 1,
                            offset: Offset(0, 1))
                      ]),
                  child: Center(
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/pass.png",
                          height: 130,
                        ),
                        Text(
                          committeeDeparts[index].title,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          committeeDeparts[index].names,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  )));
        }),
      ),
    );
  }
}
