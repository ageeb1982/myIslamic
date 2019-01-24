import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:myislamic/constant/reg.dart';
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


class DownloadFileOrg extends StatefulWidget
 {
   String url = "http:\/\/android.quran.com\/data\/getTranslation.php?id=25&ext=zip";
  bool downloading = false;
  var progressString = "";
String fileName,displayName;

  bool run=false;
  
  DownloadFileOrg({this.url,this.fileName,this.displayName,this.run=true});
  
  @override
  DownloadFileX createState() {
    return new DownloadFileX(url: url,fileName: this.fileName,displayName: this.displayName,downloading: this.run);
  }
}
final key = new GlobalKey<DownloadFileX>();




class DownloadFileX extends State<DownloadFileOrg> {
 String url = "http:\/\/android.quran.com\/data\/getTranslation.php?id=25&ext=zip";
  bool downloading = false;
  bool finsh=false;
  var progressString = "";
String fileName,displayName;
String  filePath;
DownloadFileX({this.url,this.fileName,this.displayName,this.downloading});

  @override
  void initState() {
    super.initState();

   if(downloading) downloadFile();
  }

  Future<void> downloadFile() async {
    Dio dio = Dio();

    try {
      var dir = await getApplicationDocumentsDirectory();
  filePath="${dir.path}/${this.fileName}";
      await dio.download(url, filePath,
          onProgress: (rec, total) {
        print("Rec: $rec , Total: $total");

        setState(() {
          downloading = true;
          progressString = "تحميل ملفات $displayName \n => "+((rec / total) * 100).toStringAsFixed(0) + "%";
        });
      });
    } catch (e) {
      print(e);
    }

    setState(()
     {
    
      downloading = false;
      finsh=true;
      progressString = "اكتمل تحميل $displayName بنجاح";
 extractFileZip(filePath);



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
                        "$progressString",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              )
            :finsh? Text(progressString): Text("لا يوجد بيانات"),
      );
   
  }
}



 
