import 'package:myislamic/constant/reg.dart';
import 'package:myislamic/model/ZCat.dart';
import 'package:sqflite/sqflite.dart';
//import 'package:path/path.dart';
//import 'package:path_provider/path_provider.dart';
import 'dart:async';
//import 'package:myislamic/model/User.dart';

class ZikrDBHelper{
static Database _db;
 final String zikrCatTable = 'Zikr_Cat';
  final String zikrTable = 'Zikr';
  final String zikrView = 'ZFull';
Future<Database> get db async
{
  if(_db==null){
  _db=await intDB();
  return _db;
  }
  else
  return _db;
}

intDB() async
{
  
  String path=await dbZikrPath;
  var myOwnDB=await openDatabase(path,version: 1);
  return myOwnDB;
}
//  _onCreate(Database db,int ver) async{

// }


  Future<List> getAllZikrCat({int catId=-1}) async
  {
    var dbClient = await  db;
    String _abX="";
    if(catId!=-1){_abX=" where ab = $catId order by orderX   ASC ";}
    var sql = """SELECT        SN, id, ab, txt, txtSrch, icon,noteX,
                             (SELECT  COUNT(*)
                                FROM            Zikr_Cat
                                WHERE        (ab = t.id)) AS countX
            FROM  $zikrCatTable  AS t $_abX""";
    List result = await dbClient.rawQuery(sql);
    var ee= result.toList();
    return ee;
  }

  Future<int> getCount({int ab=-1}) async{
    var dbClient = await  db;
      String _abX="";
    if(ab!=-1){_abX=" where ab = $ab";}
    var sql = "SELECT COUNT(*) FROM $zikrCatTable $_abX";

    return  Sqflite.firstIntValue(await dbClient.rawQuery(sql)) ;
  }

  Future<ZCat> getUser(int id) async{
    var dbClient = await  db;
    var sql = "SELECT * FROM $zikrCatTable WHERE id = $id";
    var result = await dbClient.rawQuery(sql);
    if(result.length == 0) return null;
    return  new ZCat.fromMap(result.first) ;
  }



Future<List> getAllZikr({int catId=-1}) async
  {
    var dbClient = await  db;
    String _catX="";
    if(catId!=-1){_catX=" where Cat_id=$catId order  by sn,orderX   ASC ";}
    var sql = """select * from Zikr   $zikrCatTable   $_catX""";
    List result = await dbClient.rawQuery(sql);
    var ee= result.toList();
    return ee;
  }







  // Future<int> deleteUser(int id) async{
  //   var dbClient = await  db;
  //   return  await dbClient.delete(
  //       userTable , where: "$columnId = ?" , whereArgs: [id]
  //   );
  // }

  // Future<int> updateUser(User user) async{
  //   var dbClient = await  db;
  //   return  await dbClient.update(
  //  userTable ,user.toMap(), where: "$columnId = ?" , whereArgs: [user.id]
  //   );
  // }


 void close() async{
    var dbClient = await  db;
    return   dbClient.close();
  }
}