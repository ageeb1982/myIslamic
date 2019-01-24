import 'dart:async';
import 'package:archive/archive.dart';
import 'package:archive/archive_io.dart';
import 'package:flutter/services.dart';
//import 'package:myislamic/model/ZCat.dart';
//import 'package:myislamic/utils/QuranDatabase_Helper.dart';
import 'package:path/path.dart';
//import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

// import 'package:sqflite/sqflite.dart';
//import 'dart:convert';
//import 'package:sqflite/sqflite.dart';
//import 'package:http/http.dart' as http;


 Future<String> get localPath async{
   final pathz=await getApplicationDocumentsDirectory();
   return pathz.path;
 }

 Future<File> get localFile async{
   final fileX=await localPath;
   return new File('$fileX/data.txt');
 }
 
 Future<File>  writeData (String value) async{
   final fileX=await localFile;
   return fileX.writeAsString('$value'); 
 }
 
 Future<String>  readData()  async{
  try {
    final file =await localFile;
    String data=await file.readAsString();
    return data;
  } catch (e) {
    return 'error: empty file';
}

 }


 



/*
*قاعدة بيانات الأذكار موجودة باستمرار داخل assets/db/Zikr.db
 */
Future<String> get dbZikrPath async{
   //final dbDir=await getDatabasesPath();
Directory docDir = await getApplicationDocumentsDirectory();

   var dbPath=join(docDir.path,"ZikrX.db");
   
ByteData data = await rootBundle.load(join("assets", "db/Zikr.db"));
List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
await new File(dbPath).writeAsBytes(bytes);

return dbPath;

 }







// Future<String> get dbSunnaPath async{
//    final dbDir=await getDatabasesPath();
//    var dbPath=join(dbDir,"Sunna.db");
   
// // Delete any existing database:
// await deleteDatabase(dbPath);

// // Create the writable database file from the bundled demo database file:
// ByteData data = await rootBundle.load("assets/Sunna.db");
// List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
// await File(dbPath).writeAsBytes(bytes);

// return dbPath;

//  }



Future<bool>  quranDBIsExist()  async  
 {
 Directory docDir = await getApplicationDocumentsDirectory();
var dbPath=join(docDir.path,"Quran.db");
 // await deleteDatabase(dbPath);
bool restultX= await new File(dbPath).exists();
return  restultX;

 }


Future<String>  dbTafseerPath(String tName)  async   {
   //final dbDir=await getDatabasesPath();
Directory docDir = await getApplicationDocumentsDirectory();

   var dbPath=join(docDir.path,tName+".db");
   
// ByteData data = await rootBundle.load(join("assets", "db/Zikr.db"));
// List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
// await new File(dbPath).writeAsBytes(bytes);
return dbPath;

 }





 
//  Future<String> get dbQuranPath async{
//    final dbDir=await getDatabasesPath();
//    var dbPath=join(dbDir,"Quran.db");
   
// // Delete any existing database:
// await deleteDatabase(dbPath);

// // Create the writable database file from the bundled demo database file:
// ByteData data = await rootBundle.load("assets/Quran.db");
// List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
// await File(dbPath).writeAsBytes(bytes);

// return dbPath;

//  }


void extractFileZip(String filePath)  async
{
  Directory docDir = await getApplicationDocumentsDirectory();

   
List<int> bytes =  new File(filePath).readAsBytesSync();

  // Decode the Zip file
  Archive archive = new ZipDecoder().decodeBytes(bytes);

  // Extract the contents of the Zip archive to disk.
  for (ArchiveFile file in archive) {
    String filename = file.name;
    if (file.isFile) {
      List<int> data = file.content;
      var dbPath=join(docDir.path,filename);
      new File(dbPath)
        ..create(recursive: true)
        .. writeAsBytesSync(data);
    } else {
      new Directory(filename)
        ..createSync(recursive: true);
    }
  }


  // // Zip a directory to out.zip using the zipDirectory convenience method
  // var encoder = new ZipFileEncoder();
  // encoder.zipDirectory(new Directory('out'), filename: 'out.zip');

}
