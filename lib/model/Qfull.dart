 class Qfull
{
    int _ayah;
    int _page;
    int _sura;
    String _suraName;
    String _tafseer;
    String _txt;
    String _txtSrch;




    

Qfull(this._ayah,
    this._page,
    this._sura,
    this._suraName,
    this._tafseer,
    this._txt,
    this._txtSrch);
Qfull.map(dynamic map){

  this._page=map['page'];
  this._ayah=map['ayah'];
    this._sura=map['sura'];
    this._suraName=map['suraName'];
    this._tafseer=map['tafseer'];
    this._txt=map['txt'];
    this._txtSrch=map['txtSrch'];
  
}


    int get page=>this._page;
    int get ayah=>this._ayah;

    int get sura=>this._sura;
    String get suraName=>this._suraName;
    String get tafseer=>this._tafseer;
    String get txt=>this._txt;
    String get txtSrch=>this._txtSrch;
Map<String,dynamic> toMap(){
  var map=new Map<String,dynamic>();

  
map['ayah']=this._ayah;
map['page']=this._page;
    map['sura']=this._sura;
    map['suraName']=this._suraName;
    map['tafseer']=this._tafseer;
    map['txt']=this._txt;
    map['txtSrch']=this._txtSrch;
  
  return map;




}

Qfull.fromMap(Map<String,dynamic>map){
  this._ayah=map['ayah'];
  this._page=map['page'];
    this._sura=map['sura'];
    this._suraName=map['suraName'];
    this._tafseer=map['tafseer'];
    this._txt=map['txt'];
    this._txtSrch=map['txtSrch'];
  

}







}