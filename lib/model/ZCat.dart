class ZCat
{
    int _id;
    int _ab;
     String _txt;
    String _txtSrch;
    String _icon;
       int _orderX;
       String _noteX;
       int _countX;


  ZCat
  (
  this._id,
  this._icon,
   this._ab,
   this._txt,
   this._txtSrch,
   this._orderX,
   this._noteX,
   this._countX,
   );
ZCat.map(dynamic map)
{
   this._id=map['id'];
  this._icon=map['icon'];
  this._ab=map['ab'];
   this._txt=map['txt'];
    this._txtSrch=map['txtSrch'];
   this._orderX=map['OrderX'];
     this._noteX=map['noteX'];
     this._countX=map['countX'];
  
}


  int get id=> _id;
  String get icon=> _icon;
  int get ab=> _ab;
String get txtSrch=> _txtSrch;
  String get txt=> _txt;
    int get zikrOrder=> _orderX;
   String get noteX=> _noteX;
   int get countX=> _countX;
  
Map<String,dynamic> toMap()
{
  var map=new Map<String,dynamic>();

  
   map['id']=this._id;
  map['icon']=this._icon;
  map['ab']=this._ab;
  map['txt']=this._txt;
  map['txtSrch']=this._txtSrch;
  map['OrderX']=this._orderX;
   map['noteX']=this._noteX;
   map['countX']=this._countX;

  return map;




}

ZCat.fromMap(Map<String,dynamic>map){
  this._id=map['id'];
  this._icon=map['icon'];
  this._ab=map['ab'];
   this._txt=map['txt'];
   this._txtSrch=map['txtSrch'];

   this._orderX=map['OrderXs'];
    this._noteX=map['noteX'];
    this._countX=map['_countX'];

}


}