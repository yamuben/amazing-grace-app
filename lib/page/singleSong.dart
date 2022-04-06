import 'package:amazing_app.v1/data/singleSongData.dart';
import 'package:amazing_app.v1/data/songData.dart';
import 'package:flutter/material.dart';

class SingleSong extends StatelessWidget {
//  const SingleSong({Key? key}):super(key:key);
  final String songTitle;
  final String note;
  final bool music;
  final List<dynamic> songData;

  SingleSong(this.songTitle, this.note, this.music, this.songData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
              Text(songTitle),
              Text(note),
              Icon(music ? Icons.play_circle : null)
            ]))),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
                child: Padding(
              padding: const EdgeInsets.only(
                  top: 15, left: 20, bottom: 15, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          songData[index].type,
                          // "bbbbbenjas",

                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          songData[index].voice,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    songData[index].value,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: songData[index].type == "Chorus"
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  )
                ],
              ),
            ));
          },
          itemCount: songData.length,
        ));
  }
}
