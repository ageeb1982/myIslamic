import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:myislamic/model/Qfull.dart';
import 'package:myislamic/utils/TafseerDBHelper.dart';

// import 'package:myislamic/screen/ZikrScreen/ZikrHeaderBanner.dart';
// import 'package:myislamic/utils/ZikrDBHelper.dart';
import 'package:share/share.dart';
//import 'package:share/share.dart';

class TafseerListDetails extends StatefulWidget {
  final Qfull item;

  TafseerListDetails(this.item);

  @override
  TafseerListDetailsState createState() {
    return new TafseerListDetailsState();
  }
}

class TafseerListDetailsState extends State<TafseerListDetails> {
  var db = new TafseerDBHelper("Quran.db"); // CALLS FUTURE

  @override
  Widget build(BuildContext context) {
    final key = new GlobalKey<ScaffoldState>();
    return Scaffold(
      resizeToAvoidBottomPadding: false,

       key: key,
      //appBar: AppBar( title:Text("بحث  ")),// Text(widget.item.txt)),
       body:         resultList(key),
          
      // bottomNavigationBar: 
      //  Row(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      // children: <Widget>[
        
         
        //CircleAvatar(radius: 70, child:  Image.asset("assets/images/logo_Quran.png", fit: BoxFit.cover,))

     // ],
    //)
   
      
      
      
      
    );
  }

  Widget resultList(GlobalKey<ScaffoldState> key) 
  {

//if(widget.item.countX==0)
 // { 
    return FutureBuilder<List>(
      future: getQuranitemList(),
      // future: getZikritemList(widget.item.id),
      initialData: List(),
      builder: (context, snapshot) {
             if (snapshot.connectionState != ConnectionState.done) {
               return Center(child: CircularProgressIndicator(backgroundColor: Colors.blue,));
              } else {
            
        return listQuranData(context, snapshot,widget.item,key);
              }
      },

);
 // }
 // else
  //{

//     return FutureBuilder<List>(
//       future: getQfullitemList(widget.item.id),
//       initialData: List(),
//       builder: (context, snapshot) {
//         return listViewData(context, snapshot,widget.item);
//       },
// );
//   }
  }


Widget listQuranData(BuildContext context, AsyncSnapshot<List> snapshot,Qfull cItem,GlobalKey<ScaffoldState> key)
   {
      
      return snapshot.hasData
        ? 
        
        
      new Directionality(
    textDirection:  TextDirection.rtl,
   
      child: 
         
         
         
      
        PageView.builder(
         physics: BouncingScrollPhysics(),
          
           scrollDirection: Axis.horizontal,
           itemCount: snapshot.data.length,
           
           itemBuilder: (_, int position) {
             String txt=snapshot.data[position].txt;
              final item = snapshot.data[position];
              Color iconColor=snapshot.data[position].tafseer==null?Colors.deepPurple[100]:Colors.red[300];
            
              return
              
                new Directionality(
    textDirection:  TextDirection.rtl,
            
              child: 
              
              Container(

      padding: EdgeInsets.all(20.0),
//     
      child:
    //Scrollable(viewportBuilder: (BuildContext context, ViewportOffset position) {},)
     SingleChildScrollView(scrollDirection: Axis.vertical,
     
     child:
      Column(children: <Widget>[
          Row(children: <Widget>[
            
            Expanded(child:
            Column(crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[ 
              Text(cItem.txt+" ( "+  (snapshot.data.length).toString() +" / " + (position+1).toString() +" )",style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold), ),
              Divider(),
               
               Text(txt,textAlign: TextAlign.right,textDirection: TextDirection.rtl, style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18.0, fontWeight: FontWeight.bold,     color: Color(0xFF061375)),   ),
            
              SizedBox(height: 10,),
              Text(item.source,textAlign: TextAlign.center,)
 ],
)

)
                  ]
      )
      
          ,
          Divider(color: Colors.red,height: 20,),
      // Expanded(child:  
        Row(
            mainAxisSize: MainAxisSize.min,

            children: [
             Column(children: <Widget>[ IconButton(iconSize: 25,icon:Icon(FontAwesomeIcons.bookOpen, color: iconColor), onPressed: () {
  
  
  if(item.tafseer!=null)
  {
  confirmDialog(context,item).then((_) {
      print("done");
    });
  }
//_showDialog();

             },),Text("متن الحديث")],),
            
            
            
            
             SizedBox(width: 50,),
             Column(children: <Widget>[ IconButton(iconSize: 25,icon:Icon(FontAwesomeIcons.copy, color: Colors.blue), onPressed: () 
             { 
              
             String cat=cItem.txt;
             String zikr=item.txt;
             String src="";
             String virt="";
             if(item.source!=null){src="المصدر:"+item.source;}
             if(item.tafseer!=null){virt="المتن:"+item.tafseer;}
              Clipboard.setData(new ClipboardData(text: "$cat\n---------\n$zikr\n----------\n$virt\n$src\n\nبواسطة تطبيق مساعد المسلم"));
              key.currentState.showSnackBar(
                    new SnackBar(content: new Text("تم نسخ"),duration:Duration(seconds: 1),));
              
              },
              )
                                          
                                          ,Text("نسخ المتن")],),
                                           SizedBox(width: 50,),
             Column(children: <Widget>[ IconButton(iconSize: 25,icon:Icon(FontAwesomeIcons.shareAlt, color: Colors.purple), onPressed: () 
             { 
              
             String cat=cItem.txt;
             String zikr=item.txt;
             String src="";
             String virt="";
             if(item.source!=null){src="المصدر:"+item.source;}
             if(item.tafseer!=null){virt="المتن:"+item.tafseer;}
             String zZ= "$cat\n---------\n$zikr\n----------\n$virt\n$src\n\nبواسطة تطبيق مساعد المسلم";
               final RenderBox box = context.findRenderObject();
              Share.share(zZ,
                                  sharePositionOrigin:
                                      box.localToGlobal(Offset.zero) &
                                          box.size);
              },
              )
                                          
                                          ,Text("مشاركة المتن")],),
             
            ],
          
          ),  
      // )
        ],
   
   
      )
   
   
 )
        
         )
         
      
                
              
           );
            
            
            },
          )
     
     
     
     
     
     
      )
        : 
        Center(
            child: CircularProgressIndicator(),
          );
        
   }

Future<bool> confirmDialog(BuildContext context,Qfull itemX) {
 
 String itemY=itemX.suraName;
 
 
  return showDialog<bool>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) 
      {
        return new AlertDialog(
          title: new Text("متن الحديث"),
          content: new Text("$itemY\n\n${itemX.txt}"),
          actions: <Widget>[
            new FlatButton(
              child: const Text('رجوع'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            
          ],
        );
      });
}

 

      
        

 Widget listViewData(BuildContext context, AsyncSnapshot<List> snapshot,Qfull cItem)
   {
    return snapshot.hasData
        ? 
        
        
        
        ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (_, int position) {
              final item = snapshot.data[position];
              return
                new Directionality(
    textDirection:  TextDirection.rtl,
            child:   Card(
                 color: Colors.blue[50],
                elevation: 2.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  leading: Icon(FontAwesomeIcons.book,color: Colors.blue,),
                  title: Text(item.txt,
                   textDirection: TextDirection.rtl,
 style: TextStyle(
     fontStyle: FontStyle.italic,
     fontSize: 18.0,
     fontWeight: FontWeight.bold,
     color: Color(0xFF061375)),
                  ),
                  onTap: ()   {
                    
//  Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => TafseerListDetails(item),
//           ),
//         );


                  },
                ),
              )
                );
            },
          )
       
        : 
        Center(
            child: CircularProgressIndicator(),
          );
  
  }

  Future<List<Qfull>> getQuranitemList([int ayah]) async {
    List<Qfull> zcatsX = new List<Qfull>();
    var myzikrCat = await db.getAllDataByAyah(ayah: ayah);
    for (int i = 0; i < myzikrCat.length; i++) {
      Qfull zCat = Qfull.map(myzikrCat[i]);
      zcatsX.add(zCat);
    }
    return zcatsX.toList();
  }








}
