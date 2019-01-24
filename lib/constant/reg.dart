import 'dart:async';
import 'package:flutter/services.dart';
//import 'package:myislamic/model/ZCat.dart';
//import 'package:myislamic/utils/QuranDatabase_Helper.dart';
import 'package:path/path.dart';
//import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
//import 'dart:convert';
import 'package:sqflite/sqflite.dart';
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


//  Future<String> get dblocalPath async{
//    final dbDir=await getDatabasesPath();
//    var dbPath=join(dbDir,"app.db");
   
// // Delete any existing database:
// await deleteDatabase(dbPath);

// // Create the writable database file from the bundled demo database file:
// ByteData data = await rootBundle.load("assets/myislamic.db");
// List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
// await File(dbPath).writeAsBytes(bytes);

// return dbPath;

//  }



 Future<String> get dbQuranPath async{
   final dbDir=await getDatabasesPath();
   var dbPath=join(dbDir,"Quran.db");
   
// Delete any existing database:
await deleteDatabase(dbPath);

// Create the writable database file from the bundled demo database file:
ByteData data = await rootBundle.load("assets/Quran.db");
List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
await File(dbPath).writeAsBytes(bytes);

return dbPath;

 }

Future<String> get dbZikrPath async{
   //final dbDir=await getDatabasesPath();
Directory docDir = await getApplicationDocumentsDirectory();

   var dbPath=join(docDir.path,"ZikrX.db");
   
ByteData data = await rootBundle.load(join("assets", "db/Zikr.db"));
List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
await new File(dbPath).writeAsBytes(bytes);

return dbPath;

 }







Future<String> get dbSunnaPath async{
   final dbDir=await getDatabasesPath();
   var dbPath=join(dbDir,"Sunna.db");
   
// Delete any existing database:
await deleteDatabase(dbPath);

// Create the writable database file from the bundled demo database file:
ByteData data = await rootBundle.load("assets/Sunna.db");
List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
await File(dbPath).writeAsBytes(bytes);

return dbPath;

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





 
