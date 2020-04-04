import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renungan_harian/database_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:renungan_harian/database_helper2.dart';
import 'home.dart';
import 'package:intl/intl.dart';
import 'data.dart';

class RenunganPage extends StatefulWidget {
  static String tag = 'renungan-page';
  @override
  _RenunganPageState createState() => _RenunganPageState();
}

class _RenunganPageState extends State<RenunganPage> {

//  int getIndex(DateTime date, int length){
//    int remaining;
//
//    for(int i=0;i<length;i++){
//      if(!=-1){
//
//      }
//    }
//  }

//  List<Datas2> country;


  DatabaseHelper db = DatabaseHelper();
  DatabaseHelper2 dbhistory = DatabaseHelper2();

  List<Datas2> tamplilList;

  Datas2 dt;

  var indexArray = List(31);

  DateTime dateTime = DateTime.now();
  String date;
  String nampungtgl;

  void randIndex(List<Datas2> list) async{
    int size = list.length;

    for(int i = 0 ; i < size; i++)
    {
      bool ulang = true;

      while (ulang)
      {
        Random random = new Random();
        int x = random.nextInt(size);



        bool cek = true;

        for (int j = 0 ; j < i; j++)
        {
          if (indexArray[j] == x)
          {
            cek = false;
            break;
          }
        }

        if (cek)
        {
          ulang = false;
          indexArray[i] = x;
        }
      }
    }
    if (size <= 31)
    {
      int i = size;
      int j = 0;
      while (i <= 31)
      {
        indexArray[i] = indexArray[j];
        i++;
        j++;
        if (j == size) j = 0;
      }
    }
    return;
  }


//  var index = 1;

  @override
  Widget build(BuildContext context) {
    int index=1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Bacaan Renungan'),
        actions: _buildTanggal(),
      ),
      body:
      Center(
        child:Column(
          children: <Widget>[
            Text('RENUNGAN HARI INI', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),),

            new FutureBuilder(
                future: db.getDataRenungan(),
                builder: (context, snapshot){
                  if (snapshot.hasData) {
                    tamplilList = snapshot.data;
//                    print(tamplilList[0].judul + tamplilList[0].ayat + tamplilList[0].description);
//                    ListView.builder(
//                        itemCount: 1,
//                        itemBuilder: (BuildContext context, int idx) {
//                          Datas2 dt = tamplilList[idx];
//                          return new Card(
//                            child: Row(
//                              children: <Widget>[
//                                Row(
//                                  crossAxisAlignment:
//                                  CrossAxisAlignment.start,
//                                  children: <Widget>[
//                                    Text(
//                                      '${dt.judul}',
//                                      style: TextStyle(fontSize:18.0,
//                                          fontWeight: FontWeight.bold),
//                                    ),
//                                    Text(
//                                      '${dt.ayat}',
//                                      style: TextStyle(
//                                          fontSize: 15,
//                                          color: Colors.black),
//                                    ),
//                                    Text(
//                                      '${dt.description}',
//                                      style: TextStyle(
//                                          fontSize: 15,
//                                          color: Colors.black),
//                                    ),
//                                  ],
//                                ),
//                              ],
//                            ),
//                          );
//                        });
                    randIndex(tamplilList);
//                    print(tamplilList[indexArray[dateTime.day]].judul);
//                    print(tamplilList[indexArray[dateTime.day]].judul);

                    dt = Datas2(tamplilList[indexArray[dateTime.day]].judul,tamplilList[indexArray[dateTime.day]].ayat,tamplilList[indexArray[dateTime.day]].description);
//                    print(dt.judul + dt.ayat + dt.description);
                    print("cccccccccccc");
                    return Column(
                      children: <Widget>[
                        Card(
                          child: ListTile(
//                leading: Icon(Icons.calendar_today),
                            title: Text("Tanggal", style: TextStyle(fontSize: 15.0),),
                            subtitle: Text(
                              nampungtgl = DateFormat("dd MMMM yyyy").format(dateTime).toString(),
                              style: TextStyle(fontSize: 25,),
                            ),
                            onTap: (){
                              _buildTanggal();
//                  showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(2020)).then((date){
//                    setState((){
//                      dateTime = date;
//                    });
//                  });
                            },
                          ),
                        ),

                        Card(
                          child: Row(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(

                                    child: Text(
                                      dt.judul,
                                      style: TextStyle(
                                          fontSize:36.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),

                                  Text(
                                    dt.ayat,
                                    style: TextStyle(
                                        fontSize:36.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  FittedBox(
                                    child: Text(
                                      dt.description,
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.black,
                                          fontStyle: FontStyle.italic
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),

                      ],
                    );
                  }else{
                    return new CircularProgressIndicator();
                  }

                }
            ),


          ],),
      ),
    );
  }
}

List<Widget> _buildTanggal() {
  return <Widget>[
    new IconButton(
      icon: const Icon(
        Icons.keyboard_arrow_right,
        color: Colors.black,
      ),
      onPressed: null,
    ),
  ];
}