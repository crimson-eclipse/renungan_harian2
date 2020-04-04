import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'tambahdetail.dart';
import 'data.dart';
import 'tambah_presenter.dart';

class DataList extends StatelessWidget {
  List<Datas2> country;
  HomePresenter homePresenter;

  DataList(
    List<Datas2> this.country,
    HomePresenter this.homePresenter, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: country == null ? 0 : country.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            child: new Container(
                child: new Center(
                  child: new Row(
                    children: <Widget>[
//                      new CircleAvatar(
//                        radius: 30.0,
//                        child: new Text(getShortName(country[index])),
//                        backgroundColor: const Color(0xFF20283e),
//                      ),
                      new Expanded(
                        child: new Padding(
                          padding: EdgeInsets.all(10.0),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
//                              new Text(
//                                index.toString(),
//                                // set some style to text
//                                style: new TextStyle(
//                                    fontSize: 30.0,
//                                    color: Colors.black,
//                                    fontWeight: FontWeight.bold),
//                              ),
                              new Text(
                                country[index].judul,
                                // set some style to text
                                style: new TextStyle(
                                    fontSize: 30.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              new Text(
                                country[index].ayat,
                                // set some style to text
                                style: new TextStyle(
                                    fontSize: 24.0,
                                    color: Colors.black87, fontStyle: FontStyle.italic),
                              ),
                              new Text(
                                "' "+ country[index].description + " '",
                                // set some style to text
                                style: new TextStyle(
                                    fontSize: 18.0, color: Colors.black87),
                              ),
                            ],
                          ),
                        ),
                      ),
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                         new IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: const Color(0xFF167F67),
                              ),
                              onPressed: () => edit(country[index], context),
                            ),

                          new IconButton(
                            icon: const Icon(Icons.delete_forever,
                                color: const Color(0xFF167F67)),
                            onPressed: () =>
                                homePresenter.delete(country[index]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0)),
          );
        });
  }

  displayRecord() {
    homePresenter.updateScreen();
  }
  edit(Datas2 data, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          new AddDataDialog().buildAboutDialog(context, this, true, data),
    );
    homePresenter.updateScreen();
  }

  String getShortName(Datas2 data) {
    String shortName = "";
    if (!data.judul.isEmpty) {
      shortName = data.judul.substring(0, 1) + ".";
    }

    if (!data.ayat.isEmpty) {
      shortName = shortName + data.ayat.substring(0, 1);
    }
    return shortName;
  }
}
