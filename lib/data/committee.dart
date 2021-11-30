import 'dart:ffi';

class Committee {
  String? title;
  String? picture ;
  String? description;
  String? names;
  String? phone;

  Committee(this.title, this.picture, this.description,this.names, this.phone);
  Committee.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    picture = json["picture"];
    description =json["description"];
    names=json["names"];
    phone=json["phone"];


  }
}