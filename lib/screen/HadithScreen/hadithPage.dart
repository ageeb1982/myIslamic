import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myislamic/constant/Constant.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:myislamic/model/Hfull.dart';
import 'package:myislamic/utils/HadithDBHelper.dart';
// import 'package:myislamic/utils/TafseerDBHelper.dart';
import 'package:after_layout/after_layout.dart';

// import 'package:myislamic/screen/ZikrScreen/ZikrHeaderBanner.dart';
// import 'package:myislamic/utils/ZikrDBHelper.dart';
import 'package:share/share.dart';
//import 'package:share/share.dart';

class HadithPage extends StatefulWidget
 {
  final Hfull item;
 int refId=0;
  HadithPage({this.item});

  @override
  HadithPageState createState() {
    return new HadithPageState(this.item);
  }
}

class HadithPageState extends State<HadithPage>
    with AfterLayoutMixin<HadithPage> {
  var db = new HadithDBHelper(); // CALLS FUTURE
  final Hfull hadithX;
  int selectItemPos = 0;
  int refId=0;
  HadithPageState([this.hadithX,this.refId=0]) 
  {
    selectItemPos = 0;
  }
  PageController _controller = new PageController();
  @override
  void afterFirstLayout(BuildContext context) {
    _goToElement(selectItemPos);
  }

  void _goToElement(int pos) {
    // _controller.animateTo((100.0 * (pos-1)), // 100 is the height of container and index of 6th element is 5
    //     duration: const Duration(milliseconds: 300),
    //     curve: Curves.easeOut);
    _controller.jumpToPage(pos);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final key = new GlobalKey<ScaffoldState>();
dynamic result;
if(refId==0){
    result= Scaffold(

        resizeToAvoidBottomPadding: false,
        key: key,
        appBar: AppBar(title: Text(hadithTITLE)),
        body: FutureBuilder<List>(
          future: getHadithItemList(),

          // future: getZikritemList(widget.item.id),
          initialData: List(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.blue,
              ));
            } else {
              // return snapshot.hasData
              //     ?
              return new Directionality(
                  textDirection: TextDirection.rtl,
                  child: PageView.builder(
                    // controller: _controller,
                    controller: PageController(
                      initialPage: selectItemPos,
                    ),
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, int position) {
                      String txt = snapshot.data[position].txt;
                      final item = snapshot.data[position];
                     
                      return new Directionality(
                          textDirection: TextDirection.rtl,
                          child: Container(
                              padding: EdgeInsets.all(20.0),
//
                              child:
                                  //Scrollable(viewportBuilder: (BuildContext context, ViewportOffset position) {},)
                                  SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(
                                        children: <Widget>[
                                          Row(children: <Widget>[
                                            Expanded(
                                                child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text("كتاب / "+
                                                item.bookName + " => "
                                                   
                                                        
                                                          " => صفحة " +
                                                          item.page.toString()
                                                          
                                                      //+" ( "+  (snapshot.data.length).toString() +" / " + (position+1).toString() +" )"
                                                      ,
                                                  style: TextStyle(
                                                      color: Colors.redAccent,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Divider(),
                                                Text(
                                                  txt,
                                                  textAlign: TextAlign.right,
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  style: TextStyle(
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xFF061375)),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  item.bookName + " \ "+ 'صفحة (${item.page}) طبعة (${item.shop})',
                                                  textAlign: TextAlign.center,
                                                )
                                              ],
                                            ))
                                          ]),
                                          Divider(
                                            color: Colors.red,
                                            height: 20,
                                          ),
                                          // Expanded(child:
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              //  Column(children: <Widget>[
                                              // IconButton(iconSize: 25,icon:Icon(FontAwesomeIcons.bookOpen, color: iconColor), onPressed: () {},),Text("متن الحديث")],),
                                              // SizedBox(width: 50,),
                                              Column(
                                                children: <Widget>[
                                                  IconButton(
                                                    iconSize: 25,
                                                    icon: Icon(
                                                        FontAwesomeIcons.copy,
                                                        color: Colors.blue),
                                                    onPressed: () 
                                                    {
                                                      
                                                    //   String ayahX = item.txt;
                                                    //   String src = "";
                                                    //   String virt = "";
                                                    //   src =
                                                    //       "*المصدر: *تفسير السعدي";
                                                    //   if (item.tafseer !=
                                                    //       null) {
                                                    //     virt =
                                                    //         "تفسير الآية:\n" +
                                                    //             item.tafseer;
                                                    //   }
                                                    //   var fullTafseer =
                                                    //       "$ayahX\n----------\n$virt\n\n$src\n\n*بواسطة تطبيق مساعد المسلم*";
                                                    //   Clipboard.setData(
                                                    //       new ClipboardData(
                                                    //           text:
                                                    //               fullTafseer));
                                                    //   key.currentState
                                                    //       .showSnackBar(
                                                    //           new SnackBar(
                                                    //     content:
                                                    //         new Text("تم نسخ"),
                                                    //     duration: Duration(
                                                    //         seconds: 1),
                                                    //   ));
                                                    },
                                                 
                                                 
                                                 //=======================================
                                                 
                                                  ),
                                                  Text("نسخ التفسير")
                                                ],
                                              ),
                                              SizedBox(
                                                width: 50,
                                              ),
                                              Column(
                                                children: <Widget>[
                                                  IconButton(
                                                    iconSize: 25,
                                                    icon: Icon(
                                                        FontAwesomeIcons
                                                            .shareAlt,
                                                        color: Colors.purple),
                                                    onPressed: () {
                                                      // String ayahX = item.txt;
                                                      // String src = "";
                                                      // String virt = "";
                                                      // src =
                                                      //     "*المصدر: *تفسير السعدي";
                                                      // if (item.tafseer !=
                                                      //     null) {
                                                      //   virt =
                                                      //       "تفسير الآية:\n" +
                                                      //           item.tafseer;
                                                      // }
                                                      // var fullTafseer =
                                                      //     "$ayahX\n----------\n$virt\n\n$src\n\n*بواسطة تطبيق مساعد المسلم*";
                                                      // String zZ = fullTafseer;
                                                      // final RenderBox box =
                                                      //     context
                                                      //         .findRenderObject();
                                                      // Share.share(zZ,
                                                      //     sharePositionOrigin:
                                                      //         box.localToGlobal(
                                                      //                 Offset
                                                      //                     .zero) &
                                                      //             box.size);
                                                    },
                                                  ),
                                                  Text("مشاركة التفسير")
                                                ],
                                              ),
                                            ],
                                          ),
                                          // )
                                        ],
                                      ))));
                    },
                  ));
              // : Center(
              //     child: CircularProgressIndicator(),
              // );
            }
          },
        ));
  
  
}
else
{

}
  return result;
  
  }

  Widget listViewData(
      BuildContext context, AsyncSnapshot<List> snapshot, Hfull cItem) {
    return snapshot.hasData
        ? ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (_, int position) {
              final item = snapshot.data[position];
              return new Directionality(
                  textDirection: TextDirection.rtl,
                  child: Card(
                    color: Colors.blue[50],
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: ListTile(
                      leading: Icon(
                        FontAwesomeIcons.book,
                        color: Colors.blue,
                      ),
                      title: Text(
                        item.txt,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF061375)),
                      ),
                      onTap: () {
//  Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => TafseerListDetails(item),
//           ),
//         );
                      },
                    ),
                  ));
            },
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  Future<List<Hfull>> getHadithItemList() async {
    List<Hfull> zcatsX = new List<Hfull>();
    var myzikrCat ;
    // if(refId==0)
    // {
    //  myzikrCat = await db.getAllDataByBook(bookId:hadithX.bookId);
    // }
    // else
    //  {
       myzikrCat = await db.getAllDataByBookAndSub(bookId: hadithX.bookId,subId:hadithX.subId );
      //  }
    
    
    
    for (int i = 0; i < myzikrCat.length; i++) {
      Hfull zCat = Hfull.map(myzikrCat[i]);
      //debugPrint("${zCat.suraName} الآية: ${zCat.ayah}");
     if(hadithX.id==zCat.id){selectItemPos=i;}
      zcatsX.add(zCat);
    }
    return zcatsX.toList();
  }
}
