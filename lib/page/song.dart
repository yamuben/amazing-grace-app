import 'dart:convert';

import 'package:amazing_app/data/singleSongData.dart';
import 'package:amazing_app/data/songData.dart';
import 'package:amazing_app/page/singleSong.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import "package:http/http.dart" as http;

class Song extends StatefulWidget {
  const Song({Key? key}) : super(key: key);

  @override
  _SongState createState() => _SongState();
}

class _SongState extends State<Song> {
  // List<SongData> _songs = List<SongData>.empty();
  List<dynamic> songList = [];
  List<dynamic> oneSong=[];


  //from locally json
  Future<void> readJson() async {
    final String response = await rootBundle.loadString("assets/songs.json");
    final data = await json.decode(response);

    setState(() {
      songList = data.map((data) => SongData.fromJson(data)).toList();

    });
  }
void setOneSongData(List<dynamic> data){
    setState(() {
      oneSong = data.map((data) =>SingleSongData.fromJson(data)).toList();
    });
}
//from api json
  // Future<List<SongData>> fetchSongs() async {
  //   var url = "https://api.com";
  //   var response = await http.get(url);
  //   var songsData = List<SongData>.empty();
  //   if (response.statusCode == 200) {
  //     var songsDataJson = json.decode(response.body);
  //     for (var songDataJson in songsDataJson) {
  //       songsData.add(SongData.fromJson(songDataJson));
  //     }
  //   }
  //   return songsData;
  // }

  @override
  void initState() {
    // TODO: implement initState
    // fetchSongs().then((value) {
    //   setState(() {
    //     _songs.addAll(value);
    //   });
    // });
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 100,
          title: Container(
            // height: 150,

            child: Column(
              children: [
                Text("Our Songs"),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for Song / lyrics',
                    prefixIcon: Icon(Icons.search),

                    // suffixIcon: Icon(Icons.camera_alt)
                  ),
                )
              ],
            ),
          )),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            /*   child: Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 20, bottom: 10, right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Text(
                  songList[index].name,
                  // "bbbbbenjas",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  songList[index].note
                  // "yyyamu"

                  )
              ],
            ),
          )*/
            child: ListTile(
              onTap: () {
                setOneSongData(songList[index].verses);
                print("");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SingleSong(songList[index].name,songList[index].note,songList[index].music,oneSong)));
              },
              title: Text(
                songList[index].name,
                style: TextStyle(fontSize: 18),
              ),
              leading: Text((index+1).toString()),
              trailing: Container(
                width: 55,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(songList[index].note!),
                    Icon(songList[index].music
                        ? Icons.play_circle
                        : null),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: songList.length,
      ),
    );
  }
}
