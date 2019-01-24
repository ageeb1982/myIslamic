   class Hfull
    {
    int _id         ;
    int _num        ;
    int _page       ;
    String _hSubject   ;
    String _typeName  ;
    String _bookName  ;
    String _printDate ;
    String _printNo   ;
    String _ref        ;
    String _shop       ;
    String _txt       ;


Hfull(this._id,this._num,this._page,this._hSubject,this._typeName,this._bookName,this._printDate,this._printNo,this._ref,this._shop,this._txt);
Hfull.map(dynamic map){
   this._id=map['id'];
   this. _num=map['numX']        ;
this._page =map['page']      ;
this._hSubject=map[' hSubject']   ;
this. _typeName=map['typeName']  ;
this. _bookName=map['book_Name']  ;
this. _printDate=map['printDate'] ;
this. _printNo=map['printNo']   ;
this. _ref=map['ref']        ;
this. _shop=map['shop']       ;
this. _txt=map['txt']       ;
  
}


  int get id=>_id;
 
    int    get  numX=> _num        ;
    int    get page=>_page       ;
    String get  hSubject=>_hSubject   ;
    String get typeName=> _typeName  ;
    String get bookName=> _bookName  ;
    String get printDate=> _printDate ;
    String get printNo=> _printNo   ;
    String get ref=> _ref        ;
    String get shop=> _shop       ;
    String get txt=> _txt       ;

Map<String,dynamic> toMap(){
  var map=new Map<String,dynamic>();
map['numX']=this. _num        ;
map['page']=this._page       ;
map[' hSubject']=this._hSubject   ;
map['typeName']=this. _typeName  ;
map['bookName']=this. _bookName  ;
map['printDate']=this. _printDate ;
map['printNo']=this. _printNo   ;
map['ref']=this. _ref        ;
map['shop']=this. _shop       ;
map['txt']=this. _txt       ;
  
  
  if(_id!=null){map['id']=this._id;}
  return map;




}
Hfull.fromMap(Map<String,dynamic>map){
  this._id=map['id'];
   this. _num=map['numX']        ;
this._page =map['page']      ;
this._hSubject=map[' hSubject']   ;
this. _typeName=map['typeName']  ;
this. _bookName=map['bookName']  ;
this. _printDate=map['printDate'] ;
this. _printNo=map['printNo']   ;
this. _ref=map['ref']        ;
this. _shop=map['shop']       ;
this. _txt=map['txt']       ;

}


    }