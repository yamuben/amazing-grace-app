import 'dart:ffi';

class SongData {
  String name = "";
  String? note;
  Object verses =[];
  bool? music;

  // SongData();
  SongData(this.name, this.note, this.verses, this.music);
  SongData.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    note = json["note"];
    verses =json["verses"];
    music =json["music"];
  }
}
