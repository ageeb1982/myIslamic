import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:myislamic/constant/reg.dart';
import 'package:myislamic/model/Hfull.dart';
import 'package:myislamic/screen/HadithScreen/hadithPage.dart';
import 'package:myislamic/screen/OtherScreen/MyAppBar.dart';
// import 'package:myislamic/screen/TafseerScreen/tafseerListDetails.dart';
// import 'package:myislamic/screen/TafseerScreen/tafseerPage.dart';
// import 'package:myislamic/screen/TafseerScreen/tafseerListDetails.dart';
// import 'package:myislamic/screen/Tools/DownloadFile.dart';
import 'package:myislamic/utils/HadithDBHelper.dart';

//  class TafseerScreenOrg extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {

//     return null;
//   }

//  }

class HadithScreen extends StatefulWidget {
  HadithScreen({this.title});
  final String title;

  @override
  HadithScreenState createState() {
    return new HadithScreenState();
  }
}

class HadithScreenState extends State<HadithScreen> {
  bool showX = false;
  Widget formX;

  bool showProgress = false;

  @override
  void initState() {
    super.initState();
    //  quranDBIsExist().then((result) {
    //   setState(() {
    //      _dbIsExist = result;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: myAppBAR(context), body: GetTafseer());
  }
}

class GetTafseer extends StatefulWidget {
  @override
  GetTafseerState createState() {
    return new GetTafseerState();
  }
}

class GetTafseerState extends State<GetTafseer> {
  // var _dbIsExist;
  final keyScf = new GlobalKey<ScaffoldState>();
  final TextEditingController txtsrch = TextEditingController();
   

  @override
  Widget build(BuildContext context) {
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
                this.setState(() {
                  keyScf.currentState.showSnackBar(new SnackBar(
                      content: new Text("بدء البحث ....." + txtsrch.text),
                      duration: Duration(seconds: 2)));
                });
              }), // icon is 48px widget.

          title: TextField(
            controller: txtsrch,
            onChanged: (text) {},
            textAlign: TextAlign.right,
            //key: txtsrch,
            style: TextStyle(color: Colors.yellow),
            decoration: InputDecoration(
                //contentPadding: new EdgeInsets.symmetric(vertical: 0.0),
                border: InputBorder.none,
                hintText: 'اكتب النص المراد البحث عنه',
                hintStyle: TextStyle(color: Colors.green),
                fillColor: Colors.white),
          ),
        ),
        body: Container(
          child: FutureBuilder<List>(
            future: getAllHadith(txtsrch.text),
            initialData: List(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Center(
                    child: CircularProgressIndicator(
                  backgroundColor: Colors.blue,
                ));
              } else {
                return listViewData(context, snapshot,txtsrch);
              }
            },
          ),
        ));
  }

  var db = new HadithDBHelper();
  Future<List<Hfull>> getAllHadith([String txt]) async {
    List<Hfull> zcatsX = new List<Hfull>();
    //txt="زيد";
    var myAyat = await db.getAllData(txt: txt);
    for (int i = 0; i < myAyat.length; i++) {
      Hfull hfull = Hfull.map(myAyat[i]);
      zcatsX.add(hfull);
    }
    return zcatsX.toList();
  }
}

Widget listViewData(
    BuildContext context, AsyncSnapshot<List> snapshot,TextEditingController txtsrch) {
  return snapshot.hasData
      ? ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (_, int position) {
            final item = snapshot.data[position];
            Widget result = new Center(
              child: Text("No Data"),
            );
             
              result = new Directionality(
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
                        // ToDo :مراجعة 
                        "${item.bookName} / ${item.typeName} / صفحة رقم : ${item.page.toString()} ",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF061375)),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HadithPage(item),
                          ),
                        );
                      },
                    ),
                  ));
            

            return result;
          },
        )
      : Center(
          child: CircularProgressIndicator(),
        );
}
