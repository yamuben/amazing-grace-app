import 'dart:ffi';

class SingleSongData {
  String? type;
  String? voice;
  String? value;

  // SongData();
  SingleSongData(this.type, this.voice, this.value);
  SingleSongData.fromJson(Map<String, dynamic> json) {
    type = json["songType"];
    voice = json["songVoice"];
    value =json["songValue"];

  }
}
