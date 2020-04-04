import 'database_helper.dart';
import 'data.dart';

import 'dart:async';


abstract class HomeContract {
  void screenUpdate();
}

class HomePresenter {

  HomeContract _view;

  var db = new DatabaseHelper();

  HomePresenter(this._view);


  delete(Datas2 data) {
    var db = new DatabaseHelper();
    db.deleteData(data);
    updateScreen();
  }

  Future<List<Datas2>> getDatas() {
    return db.getData();
  }

  updateScreen() {
    _view.screenUpdate();
  }


}
