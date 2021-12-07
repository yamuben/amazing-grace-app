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
  List<dynamic> oneSong = [];
  List<dynamic> _foundUsers = [];

  //from locally json
  Future<void> readJson() async {
    final String response = await rootBundle.loadString("assets/songs.json");
    final data = await json.decode(response);

    setState(() {
      songList = data.map((data) => SongData.fromJson(data)).toList();
      _foundUsers = songList;
    });
  }

  void setOneSongData(List<dynamic> data) {
    setState(() {
      oneSong = data.map((data) => SingleSongData.fromJson(data)).toList();
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

  // This list holds the data for the list view

  void _runFilter(String enteredKeyword) {
    List<dynamic> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = songList;
    } else {
      // results = songList
      //     .where((user) =>
      //         user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
      //     .toList();

      print(enteredKeyword.toLowerCase());

      songList.forEach(( songDetail) {
        if (songDetail.name
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()) ||
            songDetail.verses[0]["songValue"]
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
          results.add(songDetail);
      });
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

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
                  onChanged: (value) => _runFilter(value),
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
            child: ListTile(
              onTap: () {
                setOneSongData(_foundUsers[index].verses);
                print(oneSong[0].toString());
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SingleSong(
                            _foundUsers[index].name,
                            _foundUsers[index].note,
                            _foundUsers[index].music,
                            oneSong)));
              },
              title: Text(
                _foundUsers[index].name,
                style: TextStyle(fontSize: 18),
              ),
              leading: Text((index + 1).toString()),
              trailing: Container(
                width: 55,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_foundUsers[index].note!),
                    Icon(_foundUsers[index].music ? Icons.play_circle : null),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: _foundUsers.length,
      ),
    );
  }
}
