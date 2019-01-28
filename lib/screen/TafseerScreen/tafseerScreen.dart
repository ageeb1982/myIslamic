import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myislamic/constant/reg.dart';
import 'package:myislamic/model/Qfull.dart';
import 'package:myislamic/screen/OtherScreen/MyAppBar.dart';
// import 'package:myislamic/screen/TafseerScreen/tafseerListDetails.dart';
import 'package:myislamic/screen/TafseerScreen/tafseerPage.dart';
// import 'package:myislamic/screen/TafseerScreen/tafseerListDetails.dart';
import 'package:myislamic/screen/Tools/DownloadFile.dart';
import 'package:myislamic/utils/TafseerDBHelper.dart';

//  class TafseerScreenOrg extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {

//     return null;
//   }

//  }

class TafseerScreen extends StatefulWidget {
  TafseerScreen({this.title});
  final String title;

  @override
  TafseerScreenState createState() {
    return new TafseerScreenState();
  }
}

class TafseerScreenState extends State<TafseerScreen> {
  bool _dbIsExist = false;
  bool showX = false;
  Widget formX;

  bool showProgress = false;

  @override
  void initState()
   {
    super.initState();
    quranDBIsExist().then((result) {
      setState(() {
        _dbIsExist = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget resutlX;
    if (!_dbIsExist) {
      resutlX = Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
            child: Column(children: <Widget>[
          Text(widget.title),
          Text("أضغط على زر التحميل لتنزيل الملفات الرئيسية للمصحف والتفسير "),
          InkWell(
            onTap: () {
              setState(() {
                showProgress = true;
              });
            },
            child: Column(
              children: <Widget>[
                Visibility(
                  child: Icon(
                    Icons.cloud_download,
                    color: Colors.blue,
                    size: 50,
                  ),
                  visible: !showProgress,
                ),
                Visibility(
                  child: DownloadFileOrg(
                      url:
                          "https://ia601502.us.archive.org/20/items/quranDB/Quran.zip",
                      fileName: "quran.zip",
                      displayName: "القران الكريم",
                      run: showProgress),
                  visible: showProgress,
                )
              ],
            ),
          )
        ])),
      );
    } else {
      resutlX = GetTafseer();
    }

    return Scaffold(appBar: myAppBAR(context), body: resutlX);
  }
}

class GetTafseer extends StatefulWidget {
  @override
  GetTafseerState createState() {
    return new GetTafseerState();
  }
}

class GetTafseerState extends State<GetTafseer> {
  var _dbIsExist;
  final keyScf = new GlobalKey<ScaffoldState>();
  final TextEditingController txtsrch = TextEditingController();
  SrchType _schType = SrchType.sura;

  // @override 
  // void initState() {
//   txtsrch.addListener(() {
//   if(txtsrch.text=="")
//   {
//   this.setState(() 
//   {
//     keyScf.currentState.showSnackBar(
//                 new SnackBar(content: 
//                             new Text("بدء البحث ....." + txtsrch.text),
//                             duration: Duration(seconds: 2)));
//                             });
//   }
//   }
//  );
  //  super.initState();
  // }

   @override
  Widget build(BuildContext context) {
  
    //return Center(child: Text('التفسير موجود'),)
    return Scaffold(
        key: keyScf,
        appBar: AppBar(
            backgroundColor: Color(0xFF3C615A),
              //leading: Container(),
             leading: IconButton(
              icon: Icon(Icons.search),
              color: Colors.white,
              highlightColor: Colors.green,
              onPressed: () {
this.setState(() 
  {
    keyScf.currentState.showSnackBar(
                new SnackBar(content: 
                            new Text("بدء البحث ....." + txtsrch.text),
                            duration: Duration(seconds: 2)));
                            }
             );})

             , // icon is 48px widget.

            title:  TextField(
                  controller: txtsrch,
                  onChanged: (text)
                   {
    print("First text field: $text");
    if(txtsrch.text=="")
    {
_schType= SrchType.sura;
    }
    else
    {
_schType=SrchType.aya;
    }
  },
                  textAlign: TextAlign.right,
                  //key: txtsrch,
                   style: TextStyle(color: Colors.yellow),
                  decoration: InputDecoration(
                      //contentPadding: new EdgeInsets.symmetric(vertical: 0.0),
                      border: InputBorder.none,
                      hintText: 'اكتب النص المراد البحث عنه',
                      hintStyle: TextStyle(color:  Colors.green),
                      fillColor: Colors.white),
                ),
              
)
              
               
          ,
        body: Container(
          child: FutureBuilder<List>(
            future: 
            getAllaya(txtsrch.text,_schType),
            initialData: List(),
            builder: (context, snapshot) {
              return listViewData(context, snapshot, _schType);
            },
          ),
        ));
  }
var db = new TafseerDBHelper("Quran.db");
Future<List<Qfull>> getAllaya([String txt,SrchType srcType]) async
 {
    List<Qfull> zcatsX = new List<Qfull>();
    //txt="زيد";
    var myAyat = await db.getAllData(txt: txt,srchType:srcType);
    for (int i = 0; i < myAyat.length; i++) {
     
      Qfull qfull = Qfull.map(myAyat[i]);
      zcatsX.add(qfull);
    }
    return zcatsX.toList();
  }







}


 

 Widget listViewData(BuildContext context, AsyncSnapshot<List> snapshot,SrchType cItem)
   {
    return snapshot.hasData
        ? 
        
        
        
        ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (_, int position) {
              final item = snapshot.data[position];
              Widget result=new Center(child: Text("No Data"),);
              if(cItem==SrchType.aya)
              {
                var sS=item.txt;
result=   new Directionality(
    textDirection:  TextDirection.rtl,
            child: 
              InkWell(
                onTap: (){
 Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TafseerPage(item),
          ),
       );


      //             Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => (item),
      //     ),
      //  );
                },
                              child: Card(

                   color: Colors.blue[50],
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  child: 
                  ListTile(
                    // leading: Icon(FontAwesomeIcons.book,color: Colors.blue,),
                    title: 
                    Row(
                      children: <Widget>[
                        Text("${item.suraName} (${item.ayah.toString()})/" ,
                        textDirection: TextDirection.rtl,
 style: TextStyle(
     fontStyle: FontStyle.italic,
     fontSize: 18.0,
     fontWeight: FontWeight.bold,
     color: Colors.red),
                        ),
                        Expanded(
                                                child: Text("{ ${sS.substring(0,sS.length>=50?50:sS.length)+"...." } }",
                           textDirection: TextDirection.rtl,
 style: TextStyle(
     fontStyle: FontStyle.italic,
     fontSize: 18.0,
     fontWeight: FontWeight.bold,
     color: Color(0xFF061375)),
                          ),
                        ),
                      ],
                    ),
                   
                  ),
                ),
              )
                );
           
              }
              else if(cItem==SrchType.sura)
              {
result=   new Directionality(
    textDirection:  TextDirection.rtl,
            child:   Card(
                 color: Colors.blue[50],
                elevation: 2.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                child: 
                ListTile(
                  leading: Icon(FontAwesomeIcons.book,color: Colors.blue,),
                  title: 
                   Text(" ${item.sura.toString()} /  سورة: ${item.suraName} " ,
                        textDirection: TextDirection.rtl,
 style: TextStyle(
     fontStyle: FontStyle.italic,
     fontSize: 18.0,
     fontWeight: FontWeight.bold,
     color: Color(0xFF061375)),
                        
                   
                      ),
                  onTap: ()   {
                    
 Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TafseerPage(item),
          ),
       );


                  },
                ),
              )
                );
           
              }
              
              
              
              
              
              return result;


 },
          )
       
        : 
        Center(
            child: CircularProgressIndicator(),
          );
  
  }