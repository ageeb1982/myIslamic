import 'package:myislamic/constant/reg.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
 

class HadithDBHelper{
static Database _db;
 //final String tName;
 final sqlHadith = """
 SELECT Hadith.id, Hadith.txt,Hadith.Type_Id typeId, HType.Type_Name as TypeName, Hadith.num,
  Hadith.page, Hadith.sub_id as subId, HSubject.HSubject,Hadith.ref_id as refId, HBook.ref, HBook.book_Name as bookName, 
  HBook.print_No as printNo, HBook.print_Date as printDate, HBook.shop 
FROM Hadith INNER JOIN
 HSubject ON Hadith.sub_id = HSubject.id LEFT OUTER 
  JOIN HType ON Hadith.Type_Id = HType.id LEFT OUTER
   JOIN HBook ON Hadith.ref_id = HBook.id  
""";
  
  
  // JOIN Hbook_Info ON Hadith.ref_id = Hbook_Info.id LEFT OUTER

  //HadithDBHelper();
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
  
  String path=await dbHadithPath;
  var myOwnDB=await openDatabase(path,version: 1);
  return myOwnDB;
}


 


Future<List> getAllBookIndex({int bookId=1}) async
  {
    var dbClient = await  db;
    var sql="";
    var ordX="";
    var qury="";

    
if(bookId==null|| bookId==0){bookId=1;}



sql="select id,HSubject,$bookId as bookId from  Hsubject";
 

qury="$sql $ordX";     
// qury="$sql";     

    
    // List result = await dbClient.rawQuery(qury);
    List result = await dbClient.rawQuery(qury);
   
   
   
    var ee= result.toList();
    return ee;
  }

Future<List> getAllDataByBookAndSub({int bookId=1,int subId=0}) async
  {
    var dbClient = await  db;
    var sql="";
    var ordX="";
    var qury="";

if(bookId==null|| bookId==0){bookId=1;}



sql=sqlHadith;

ordX=" order by Hadith.ref_id,Hadith.page, Hadith.num   ASC";
  
sql="$sql Where hadith.ref_id = $bookId ";
 

if(subId!=null)
 {
   if(subId!=0){
if(sql.toString().trim()=="")
{
sql="$sql Where hadith.Sub_id = $subId ";
}
else
sql = "$sql And  hadith.Sub_id = $subId  ";
   }
 }
qury="$sql $ordX";     
// qury="$sql";     

    
    // List result = await dbClient.rawQuery(qury);
    List result = await dbClient.rawQuery(qury);
   
   
   
    var ee= result.toList();
    return ee;
  }



Future<List> getAllDataByBook({int bookId=1}) async
  {
    var dbClient = await  db;
    var sql="";
    var ordX="";
    var qury="";

    

if(bookId==null|| bookId==0){bookId=1;}



sql=sqlHadith;
ordX=" order by Hadith.ref_id,Hadith.page, Hadith.num   ASC";
 
sql="$sql Where Hadith.ref_id = $bookId ";
  

qury="$sql $ordX";     
// qury="$sql";     

    
    // List result = await dbClient.rawQuery(qury);
    List result = await dbClient.rawQuery(qury);
   
   
   
    var ee= result.toList();
    return ee;
  }






Future<List> getAllData({String txt:""}) async
  {
    var dbClient = await  db;
    var sql="";
    var ordX="";
    var qury="";
  
sql = sqlHadith;
ordX=" order by Hadith.ref_id,Hadith.page, Hadith.num   ASC";
 
if(txt!=""){
  sql="$sql Where Hadith.txt Like '%$txt%'";
  
}
else
{
  sql="SELECT * FROM HBook";
  ordX="";
}

    
    
qury="$sql $ordX";     

    
    List result = await dbClient.rawQuery(qury);
    var ee= result.toList();
    return ee;
  }





 

 void close() async{
    var dbClient = await  db;
    return   dbClient.close();
  }
}
