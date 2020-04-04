import 'package:intl/intl.dart';

class Datas2 {

  int id;
  String _judul;
  String _ayat;
  String _description;
  String _date;

  Datas2(this._judul, this._ayat, this._description, this._date);

  Datas2.map(dynamic obj) {
    this._judul = obj["judul"];
    this._ayat = obj["ayat"];
    this._description = obj["description"];
    this._date = obj["date"];
  }

  String get judul => _judul;

  String get ayat => _ayat;

  String get description => _description;

  String get date => _date;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["judul"] = _judul;
    map["ayat"] = _ayat;
    map["description"] = _description;
    map["date"] = _date;

    return map;
  }

//  void setDataId(int id) {
//    this.id = id;
//  }
}
