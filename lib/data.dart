class Datas2{

  int id;
  String _judul;
  String _ayat;
  String _description;

  void setJudul(String title){
    this._judul = title;
  }
  void setAyat(String title) {
    this._ayat = title;
  }
  void setDeskripsi(String title) {
    this._description = title;
  }

  Datas2(this._judul, this._ayat, this._description);

  Datas2.map(dynamic obj) {
    this._judul = obj["judul"];
    this._ayat = obj["ayat"];
    this._description = obj["description"];
  }

  String get judul => _judul;

  String get ayat => _ayat;

  String get description => _description;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["judul"] = _judul;
    map["ayat"] = _ayat;
    map["description"] = _description;

    return map;
  }

  void setDataId(int id) {
    this.id = id;
  }
}
