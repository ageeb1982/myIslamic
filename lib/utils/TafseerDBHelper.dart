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


Future<List> getAllDataByAyah({int ayah=0}) async
  {
    var dbClient = await  db;
    var sql="";
    var ordX="";
    var qury="";
   // srchType=SrchType.sura;
   //if(txt=="")
    //ToDo
    /**
     * حذف where sura =1 
     * بعد الإنتهاء من الخطأ
     */
sql = "select * from  Qfull where sura=1 ";
ordX="order  by sura,ayah   ASC";
if(ayah!=null)
{
if(ayah!=0 ){sql="$sql Where ayah Like '%$ayah%'";}
  }

qury="$sql $ordX";     

    
    List result = await dbClient.rawQuery(qury);
    var ee= result.toList();
    return ee;
  }

 
Future<List> getAllData({String txt:"",SrchType srchType=SrchType.sura}) async
  {
    var dbClient = await  db;
    var sql="";
    var ordX="";
    var qury="";
   // srchType=SrchType.sura;
   //if(txt=="")
    if(srchType==SrchType.aya)
    {
sql = "select * from  Qfull";
ordX="order  by sura,ayah   ASC";
if(txt!=""){
  sql="$sql Where txtSrch Like '%$txt%'";
  
}

    }
    else if(srchType==SrchType.sura)
    {
sql = "select sura,sura_Name as suraName from  SuraName";

ordX="order  by sura   ASC";
if(txt!=""){
  sql="$sql Where sura_Name Like '%$txt%'";
}
    }
    
qury="$sql $ordX";     

    
    List result = await dbClient.rawQuery(qury);
    var ee= result.toList();
    return ee;
  }

// Future<List> getAllAya({String ayaTxt:""}) async
//   {
//     var dbClient = await  db;
//     String _catX="";
    
    
//     var sql = "select * from  SuraName order by sura";

//     if(ayaTxt!=""){_catX=" where Cat_id=$catId order  by sn,orderX   ASC ";}
//     List result = await dbClient.rawQuery(sql);
//     var ee= result.toList();
//     return ee;
//   }





 

 void close() async{
    var dbClient = await  db;
    return   dbClient.close();
  }
}
