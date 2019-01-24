import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myislamic/constant/Constant.dart';
//import 'package:myislamic/model/Item.dart';
import 'package:myislamic/model/ZCat.dart';
import 'package:myislamic/screen/OtherScreen/MyScoff.dart';
//import 'package:myislamic/screen/ZikrScreen/ZikrList.dart';
//import 'package:myislamic/utils/ZikrDBHelper.dart';
// import 'MyAppBar.dart';
// import 'MyScoff.dart';
//import 'dart:convert';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
//import 'package:myislamic/screen/ZikrScreen/ZikrList.dart';

class HomeScreen extends StatefulWidget  {
  @override
  HomeScreenState createState() {
    return new HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  List<ZCat> itemList;

  @override
  Widget build(BuildContext context)  {
    //itemList =  _itemList();

    return  myScoff(context,
      bodyX:  _gridView(),
    );
  }

var inkColor=Colors.lightGreen[50];
  var avartBackColor=Colors.black;
  var avartForeColor=Colors.white;
  var titleStyle=TextStyle(color: Colors.blueGrey[300],fontWeight:FontWeight.bold);

  Widget _gridView() {
    return
    new Directionality(
      
      textDirection:  TextDirection.rtl,
     
    
        child:
         new Padding(
         padding: const EdgeInsets.all(20),
        
        
        child:
        GridView.count(
          
          mainAxisSpacing: 10,
          crossAxisSpacing:  10,
          crossAxisCount: 2,
          // Generate 100 Widgets that display their index in the List
          children: _itemList()
          )
         )
        
         
                );
             
             
              
    
                    
       
             
             
          }
        
         
          List<Widget> _itemList() 
  {
 var  ddd=[
 //الأذكار
 InkWell(onTap: () {Navigator.pushNamed(context, 
     //link
      zikrSCREEN
      );},child:Card(elevation: 1.0,  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
      child: Column(children: <Widget>[AspectRatio(aspectRatio: 15.0 / 12.0,
      child: 
        
                Image.asset(
               "assets/images/logo_Azkar.png",
                fit: BoxFit.contain,
              ),
              
      ),
      
      Text(
      //العنوان
      zikrTITLE,
      textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,maxLines: 2,style: TextStyle(fontSize: 15.0,color: Color(0xFFD73C29),fontWeight: FontWeight.bold),
       )]))),  

//التفسير
 InkWell(onTap: () {Navigator.pushNamed(context, 
     //link
      tafseerSCREEN
      );},child:Card(elevation: 1.0,  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
      child: Column(children: <Widget>[AspectRatio(aspectRatio: 15.0 / 12.0,
      child:
        
                Image.asset(
               "assets/images/logo_Quran.png",
                fit: BoxFit.contain,
              ),
              
      ),
      Text(
      //العنوان
      tafseerTITLE,
      textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,maxLines: 2,style: TextStyle(fontSize: 15.0,color: Color(0xFFD73C29),fontWeight: FontWeight.bold),
       )]))),  

//الحديث
 InkWell(onTap: () {Navigator.pushNamed(context, 
     //link
      hadethSCREEN
      );},child:Card(elevation: 1.0,  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
      child: Column(children: <Widget>[AspectRatio(aspectRatio: 15.0 / 12.0,
   child:
        
                Image.asset(
               "assets/images/logo_hadith.png",
                fit: BoxFit.contain,
              ),
              
      ),
      
      Text(
      //العنوان
      hadithTITLE,
      textAlign: TextAlign.center, overflow: TextOverflow.ellipsis ,style: TextStyle(fontSize: 15.0,color: Color(0xFFD73C29),fontWeight: FontWeight.bold),
       )]))),  

//الفتاوى
 InkWell(onTap: () {Navigator.pushNamed(context, 
     //link
      fatwaSCREEN
      );},child:Card(elevation: 1.0,  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
      child: Column(children: <Widget>[AspectRatio(aspectRatio: 15.0 / 12.0,
   child:
        
                Image.asset(
               "assets/images/logo_fatwa.png",
                fit: BoxFit.contain,
              ),
              
      ),
      
      Text(
      //العنوان
      fatwaTITLE,
      textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,maxLines: 2,style: TextStyle(fontSize: 15.0,color: Color(0xFFD73C29),fontWeight: FontWeight.bold),
       )]))),  

//مسائل مهمة
 InkWell(onTap: () {Navigator.pushNamed(context, 
     //link
      importantSCREEEN
      );},child:Card(elevation: 1.0,  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
      child: Column(children: <Widget>[AspectRatio(aspectRatio: 15.0 / 12.0,
       child:
        
                Image.asset(
               "assets/images/logo_important.png",
                fit: BoxFit.contain,
              ),
              
      ),
      Text(
      //العنوان
      importantTITLE,
      textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,maxLines: 2,style: TextStyle(fontSize: 15.0,color: Color(0xFFD73C29),fontWeight: FontWeight.bold),
       )]))),  

//شباب المستقبل
 InkWell(onTap: () {Navigator.pushNamed(context, 
     //link
      futureSCREEN
      );},child:Card(elevation: 1.0,  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
      child: Column(children: <Widget>[AspectRatio(aspectRatio: 15.0 / 12.0,
      child:
        
                Image.asset(
               "assets/images/logo_futrue.png",
                fit: BoxFit.contain,
              ),
              
      ),
      
      
      Text(
      //العنوان
      futureTITLE,
      textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,maxLines: 2,style: TextStyle(fontSize: 15.0,color: Color(0xFFD73C29),fontWeight: FontWeight.bold),
       )]))),  




 

       
            
              
              ];
    
            




   
return  ddd;}
          }
 
