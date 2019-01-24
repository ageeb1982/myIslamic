 class Tafseer
{
  String _tName;
  int _ayah;
  int _sura;
  String _txt;
 // String _txtSrch;




    

Tafseer(
  this._tName,
  this._ayah,
  this._sura,
  this._txt,
  //this._txtSrch
  );
Tafseer.map(dynamic map){

  this._tName=map['tName'];
  this._ayah=map['ayah'];
    this._sura=map['sura'];
     this._txt=map['txt'];
    //this._txtSrch=map['txtSrch'];
  
}


     
    int get ayah=>this._ayah;
    String get tName=>this._tName;

    int get sura=>this._sura;
    String get txt=>this._txt;
    //String get txtSrch=>this._txtSrch;
Map<String,dynamic> toMap(){
  var map=new Map<String,dynamic>();

  
map['ayah']=this._ayah;
map['tNames']=this._tName;
    map['sura']=this._sura;
    
    map['txt']=this._txt;
   // map['txtSrch']=this._txtSrch;
  
  return map;




}

Tafseer.fromMap(Map<String,dynamic>map){
  this._ayah=map['ayah'];
  this._tName=map['tId'];
  this._sura=map['sura'];
  this._txt=map['txt'];
 // this._txtSrch=map['txtSrch'];
  

}







}