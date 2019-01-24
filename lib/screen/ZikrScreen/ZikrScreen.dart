import 'package:flutter/material.dart';
//import 'package:myislamic/model/Item.dart';
import 'package:myislamic/model/ZCat.dart';
import 'package:myislamic/screen/OtherScreen/MyScoff.dart';
import 'package:myislamic/screen/ZikrScreen/ZikrList.dart';
import 'package:myislamic/utils/ZikrDBHelper.dart';
// import 'MyAppBar.dart';
// import 'MyScoff.dart';
//import 'dart:convert';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ZikrScreen extends StatefulWidget  {
  @override
  ZikrScreenState createState() {
    return new ZikrScreenState();
  }
}

class ZikrScreenState extends State<ZikrScreen> {
  List<ZCat> itemList;

  @override
  Widget build(BuildContext context)  {
    //itemList =  _itemList();

    return  myScoff(context,
      bodyX:  _gridView(),
    );
  }

var db = new ZikrDBHelper();

 Future< List<ZCat>> _itemList() async
  {
List<ZCat> zcatsX=new List<ZCat>();
    var myzikrCat = await db.getAllZikrCat(catId: 200);
for(int i =0 ; i < myzikrCat.length;i++){
  ZCat zCat = ZCat.map(myzikrCat[i]);
     zcatsX.add(zCat);
}
return  zcatsX.toList();}

  Widget _gridView() {
    return
    new Directionality(
      
      textDirection:  TextDirection.rtl,
     child:FutureBuilder(
        future: _itemList()
        , builder: (BuildContext context, AsyncSnapshot snapshot) {
 if (snapshot.hasData) {
//var ww=snapshot;
         return new Padding(
                padding: const EdgeInsets.all(4.0),
                //this is what you actually need
                child: new StaggeredGridView.count(
                  crossAxisCount: 4, // I only need two card horizontally
                  padding: const EdgeInsets.all(2.0),
                  children: snapshot.data.map<Widget>((item) {
                    
                    return new ZikrList(item: item);
                  }).toList(),

                  //Here is the place that we are getting flexible/ dynamic card for various images
                  staggeredTiles: snapshot.data
                      .map<StaggeredTile>((_) => StaggeredTile.fit(2))
                      .toList(),
                  mainAxisSpacing: 3.0,
                  crossAxisSpacing: 4.0, // add some space
                ),
              );
 }
else
{
  return Center(
                  child:
                      new CircularProgressIndicator()); // If there are no data show this
            }}


       
        //map((zCat) => ZikrList(item: zCat),).toList();
        ));
     
     
  }
}
