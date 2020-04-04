import 'package:flutter/material.dart';
import 'home.dart';

class SettingPage extends StatefulWidget {
  static String tag = 'setting-page';
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  void _alertdialogprivacy(){
    AlertDialog alertDialog = new AlertDialog(
      title: Text("Privacy RenunganHarian", style: new TextStyle(fontSize: 28.0, color: Colors.black),),
      content: new Text(
        "RenunganHarian adalah layanan renungan harian kristen yang ada di Indonesia. RenunganHarian lahir untuk menjadi wadah sinergi bagi semua layanan masyarakat dalam membaca renungan kristen. Perpindahan ke RenunganHarian adalah proses penginputan data yang tercatat di masing-masing akun, sehingga sampai pada renungan lain yang tertuju pada aplikasi. Waktu pelaksanaan adalah sesuai dengan registrasi waktu sekarang. Keamanan informasi Data Pribadi Anda adalah hal yang sangat penting bagi kami. Finarya memastikan bahwa informasi yang dikumpulkan akan disimpan dengan aman, namun harap diketahui bahwa tidak ada metode menyangkut transmisi data melalui internet, atau metode penyimpanan elektronik yang benar-benar 100% (seratus persen) aman. Kami berusaha untuk melindungi Data Pribadi Anda. Kami menyimpan informasi Data Pribadi Anda dengan cara: Membatasi akses ke dalam informasi Data Pribadi Anda. Secara aman menghancurkan informasi Data Pribadi Anda saat kami tidak lagi membutuhkannya untuk tujuan tertentu.",
        style: new TextStyle(fontSize: 14.0),
      ),
      actions: <Widget>[
        new RaisedButton(
          color: Colors.greenAccent,
          child: new Text("cancel"),
          onPressed: (){
            Navigator.pop(context);
          },)
      ],
    );
    showDialog(context: context, child: alertDialog);
  }

  void _alertdialoghelp(){
    AlertDialog alertDialog = new AlertDialog(
      title: Text("Privacy RenunganHarian", style: new TextStyle(fontSize: 28.0, color: Colors.black),),
      content: new Text(
          "Anda bingung memakai aplikasi ini? \n" + "\n" +
              "1. Pilih Renungan, secara otomatis akan menampilkan data renungan yang ada\n" +"\n" +
              "2. Jika ingin menambahkan renungan, pada tampilan home pilih add renungan maka akan secara otomatis user bisa menambahkan renungan,\n" +"\n" +
              "3. Jika ingin melihat history renungan yang dibaca, pada tampilan home bisa memilih riwayat maka akan tampil history yang dibaca oleh pengguna,\n" +"\n" +
              "4. Ada fitur pengaturan untuk membantu user.",
        style: new TextStyle(fontSize: 14.0),
      ),
      actions: <Widget>[
        new RaisedButton(
          color: Colors.greenAccent,
          child: new Text("cancel"),
          onPressed: (){
            Navigator.pop(context);
          },)
      ],
    );
    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
//              elevation: 4.0,
//              margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.account_circle, color: Colors.grey,),
                    title: Text("Account"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: (){},
                  ),
                  ListTile(
                    leading: Icon(Icons.help, color: Colors.grey,),
                    title: Text("Help"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: (){
                      _alertdialoghelp();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.vpn_key, color: Colors.grey,),
                    title: Text("Privacy"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: (){
                      _alertdialogprivacy();
                    },
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
