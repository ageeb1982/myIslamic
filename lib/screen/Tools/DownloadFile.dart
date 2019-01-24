import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

// void main() => runApp(MaterialApp(
//       home: MyApp(),
//       debugShowCheckedModeBanner: false,
//     ));

// class MyApp extends StatefulWidget {
//   @override
//   MyAppState createState() {
//     return new MyAppState();
//   }
// }


class DownloadFileX extends StatefulWidget {
  @override
  DownloadFileXState createState() {
    return new DownloadFileXState();
  }
}
final key = new GlobalKey<DownloadFileXState>();




class DownloadFileXState extends State<DownloadFileX> {
 String url = "http:\/\/android.quran.com\/data\/getTranslation.php?id=25&ext=zip";
  bool downloading = false;
  var progressString = "";
String fileName,displayName;
DownloadFileXState({this.url,this.fileName,this.displayName});

  @override
  void initState() {
    super.initState();

    downloadFile();
  }

  Future<void> downloadFile() async {
    Dio dio = Dio();

    try {
      var dir = await getApplicationDocumentsDirectory();

      await dio.download(url, "${dir.path}/${this.fileName}.db",
          onProgress: (rec, total) {
        print("Rec: $rec , Total: $total");

        setState(() {
          downloading = true;
          progressString = "تحميل ملفات $displayName  => "+((rec / total) * 100).toStringAsFixed(0) + "%";
        });
      });
    } catch (e) {
      print(e);
    }

    setState(() {
      downloading = false;
      progressString = "اكتمل تحميل $displayName بنجاح";
    });
    print("اكتمل تحميل $displayName بنجاح");
  }

  @override
  Widget build(BuildContext context) {
    return 
     Center(
        child: downloading
            ? Container(
                height: 120.0,
                width: 200.0,
                child: Card(
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Downloading File: $progressString",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              )
            : Text("لا يوجد بيانات"),
      );
   
  }
}



 
