import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class TambahPage extends StatefulWidget {
  static String tag = 'tambah-page';
  @override
  _TambahPageState createState() => _TambahPageState();
}

class _TambahPageState extends State<TambahPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Renungan'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[

            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
//                controller: titleController,
//                style: textStyle,
                onChanged: (value){
                  debugPrint('Something');
                },
                decoration: InputDecoration(
                  labelText: 'Judul',
//                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  )
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: TextField(
//                controller: descriptionController,
//                style: textStyle,
                onChanged: (value){
                  debugPrint('Something');
                },
                decoration: InputDecoration(
                    labelText: 'Ayat',
//                  labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),

              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: TextField(
//                controller: descriptionController,
//                style: textStyle,
                onChanged: (value){
                  debugPrint('Something');
                },
                decoration: InputDecoration(
                    labelText: 'Description',
//                  labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    ),
                ),

              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: (){
                          setState(() {
                            debugPrint("Save button clicked");
                          });
                        },
                      ),
                  ),

                  Container(width: 5.0,),

                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Cancel',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: (){
                        setState(() {
                          debugPrint("Cancel button clicked");
                        });
                      },
                    ),
                  ),

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
