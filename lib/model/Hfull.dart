   class Hfull
    {
    int _id         ;
    int _num        ;
    int _page       ;
    int _subId   ;
    String _hSubject   ;
    int _typeId  ;
    String _typeName  ;
    String _printDate ;
    String _printNo   ;
    
    //String _bookName  ;

    int _bookId        ;

    String _bookName        ;
    String _shop       ;
    String _txt       ;
    


Hfull(
  this._id,
  this._num,this._page,this._subId,this._hSubject,this._typeId,this._typeName,this._bookName,this._printDate,this._printNo,this._bookId,this._shop,this._txt);
Hfull.map(dynamic map){
   this._id=map['id'];
   this. _num=map['numX']        ;
this._page =map['page']      ;
this._subId=map['subId']   ;
this._hSubject=map['hSubject']   ;
this. _typeId=map['typeId']  ;
this. _typeName=map['typeName']  ;
// this. _bookName=map['book_Name']  ;
this. _printDate=map['printDate'] ;
this. _printNo=map['printNo']   ;
this. _bookId=map['refId']        ;
this. _bookName=map['ref']        ;
this. _shop=map['shop']       ;
this. _txt=map['txt']       ;
  
}


  int get id=>_id;
 
    int    get  numX=> _num        ;
    int    get page=>_page       ;
    int get  subId=>_subId   ;
    String get  hSubject=>_hSubject   ;
    int get typeId=> _typeId  ;
    String get typeName=> _typeName  ;
    String get printDate=> _printDate ;
    String get printNo=> _printNo   ;
    int get bookId=> _bookId        ;
    String get bookName=> _bookName  ;

    String get ref=> _bookName        ;
    String get shop=> _shop       ;
    String get txt=> _txt       ;

Map<String,dynamic> toMap(){
  var map=new Map<String,dynamic>();
map['numX']=this. _num        ;
map['page']=this._page       ;
map[' subId']=this._subId   ;
map[' hSubject']=this._hSubject   ;
map['typeId']=this. _typeId  ;
map['typeName']=this. _typeName  ;
// map['bookName']=this. _bookName  ;
map['printDate']=this. _printDate ;
map['printNo']=this. _printNo   ;
map['refId']=this. _bookId        ;
map['ref']=this. _bookName        ;
map['shop']=this. _shop       ;
map['txt']=this. _txt       ;
  
  
  if(_id!=null){map['id']=this._id;}
  return map;




}
Hfull.fromMap(Map<String,dynamic>map){
  this._id=map['id'];
   this. _num=map['numX']        ;
this._page =map['page']      ;
this._subId=map['subId']   ;
this._hSubject=map['hSubject']   ;
this. _typeId=map['typeId']  ;
this. _typeName=map['typeName']  ;
// this. _bookName=map['book_Name']  ;
this. _printDate=map['printDate'] ;
this. _printNo=map['printNo']   ;
this. _bookId=map['refId']        ;
this. _bookName=map['ref']        ;
this. _shop=map['shop']       ;
this. _txt=map['txt']       ;
  
}


    }