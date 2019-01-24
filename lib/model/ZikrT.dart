class ZikrT
{
    int _id;
    int _catId;
    String _txt;
    String _txtSrch;
    String _source;
    String _virtue;
    int _orderX;


  ZikrT(
  this._id,
  this._catId,
  this._source,
  this._txt,
  this._txtSrch,
  this._virtue,
  
  this._orderX
  );
ZikrT.map(dynamic map){
  this._id=map['id'];
  this._catId=map['cat_Id'];
 
  this._source=map['source'];
  this._txt=map['txt'];
  this._txtSrch=map['txtSrch'];
  this._virtue=map['virtue'];
   
  this._orderX=map['orderX'];
  
}


  int get id=> _id;
  int get catId=> _catId;
  
  String get source=> _source;
  String get txt=> _txt;
  String get txtSrch=> _txtSrch;
  String get virtue=> _virtue;
 
  int get orderX=> _orderX;
  
Map<String,dynamic> toMap(){
  var map=new Map<String,dynamic>();

  
   map['id']=this._id;
  map['cat_Id']=this._catId;
 
  map['source']=this._source;
  map['txt']=this._txt;
  map['txtSrch']=this._txtSrch;
  map['virtue']=this._virtue;
   
  map['OrderX']=this._orderX;
  return map;




}

ZikrT.fromMap(Map<String,dynamic>map){
  this._id=map['id'];
  this._catId=map['cat_sId'];
  
  this._source=map['source'];
  this._txt=map['txt'];
  this._txtSrch=map['txtSrch'];
  this._virtue=map['virtue'];
 
  this._orderX=map['orderX'];

}


}