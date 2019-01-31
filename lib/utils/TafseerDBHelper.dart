import 'package:myislamic/constant/reg.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
 

class TafseerDBHelper{
static Database _db;
 final String tName;
 final sqlQuran = """SELECT 
quran.SN as sn,
quran.page,
quran.sura,
quran.ayah,
SuraName.sura_Name as suraName,
quran.txt_srch as txtSrch,
quran.txt,
quran.tafseer
FROM quran INNER JOIN SuraName ON quran.sura = SuraName.sura  """;
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
    /*
     * حذف where sura =1 
     * بعد الإنتهاء من الخطأ
     */
//sql = "select * from  Qfull where sura=1  ";
sql=sqlQuran;
// ordX="order  by sura,ayah   ASC";
if(ayah!=null)
{
if(ayah!=0 )
{sql="$sql Where quran.ayah Like '%$ayah%'";}
  }

qury="$sql $ordX";     
// qury="$sql";     

    
    // List result = await dbClient.rawQuery(qury);
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
// sql = "select sn,page,sura,ayah,suraName,txtSrch,txt,tafseer from  Qfull ";
sql = sqlQuran;
ordX="order  by quran.sura,quran.ayah   ASC";
ordX="order  by quran.sura,quran.ayah   ASC";
// quran.sura,
// quran.ayah,
if(txt!=""){
  sql="$sql Where quran.txt_srch Like '%$txt%'";
  
}

    }
    else if(srchType==SrchType.sura)
    {
// sql = "select sura,sura_Name as suraName from  SuraName";
sql = sqlQuran + " where quran.ayah=1 ";

ordX="order  by quran.sura   ASC";
if(txt!=""){
  sql="$sql Where SuraName.sura_Name Like '%$txt%'";
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
