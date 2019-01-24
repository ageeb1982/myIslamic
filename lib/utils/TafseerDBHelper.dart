import 'package:myislamic/constant/reg.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
 

class TafseerDBHelper{
static Database _db;
 final String tName;
  TafseerDBHelper(this.tName);
Future<Database> get db async
{
  if(_db==null){
  _db=await intDB(tName);
  return _db;
  }
  else
  return _db;
}

intDB(String tName) async
{
  
  String path=await dbTafseerPath(tName);
  var myOwnDB=await openDatabase(path,version: 1);
  return myOwnDB;
}




Future<List> getAllZikr({int catId=-1}) async
  {
    var dbClient = await  db;
    String _catX="";
    if(catId!=-1){_catX=" where Cat_id=$catId order  by sn,orderX   ASC ";}
    var sql = """select * from Zikr   $tName   $_catX""";
    List result = await dbClient.rawQuery(sql);
    var ee= result.toList();
    return ee;
  }






 

 void close() async{
    var dbClient = await  db;
    return   dbClient.close();
  }
}