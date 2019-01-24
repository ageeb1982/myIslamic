import 'package:flutter/material.dart';
//import 'package:myislamic/main.dart';
import 'package:myislamic/constant/Constant.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Drawer myDrawer(BuildContext context) {
  Drawer drawer = Drawer(
    child: drawerList(context),
  );

  return drawer;
}
  
drawerList(BuildContext context) {
 return       Directionality(textDirection: TextDirection.rtl,child:
 new ListView(
    
     // padding: EdgeInsets.,
     children: <Widget>[
     Container(
        height: 70.0,
      child:
       DrawerHeader(
       
        child: Text('قائمة المساعد اليومي للمسلم',style:TextStyle(color:  Colors.white,fontSize: 20),),
        decoration: BoxDecoration(
          color: Colors.lightBlue,
border: Border.all(
      color: Colors.cyan,
     // width:  8.0,
    ),

        ),
        
      )),
     //الرئيسية
      Ink(
      color: inkColor,

      child:
      Directionality(textDirection: TextDirection.rtl,child:
      ListTile(
            

        contentPadding: EdgeInsets.all(15.0),
        leading: CircleAvatar(
          backgroundColor: avartBackColor ,
         // foregroundColor: avartForeColor,
          child: Icon(Icons.home),
        ),
        title: Text(homeTITLE,style: titleStyle,),
        subtitle: Text(homeSubTITLE),

        onTap: () {
          Navigator.pushNamed(context, homeSCREENx);
          // ...
        },
      ))),
      
      
      //الأذكار
      Ink(
      color: inkColor,

      child:  ListTile(
        leading: CircleAvatar(
          backgroundColor: avartBackColor,
         // foregroundColor: avartForeColor,
          child: Icon(FontAwesomeIcons.timesCircle),
        ),
        title: Text(zikrTITLE,style: titleStyle,),
        subtitle: Text(zikrSubTITLE,  ),
        onTap: () {          Navigator.pushNamed(context, zikrSCREENx);        },
      )),
    
    //التفسير
    Ink(
      color: inkColor,

      child:  ListTile(
        leading: CircleAvatar(
          backgroundColor: avartBackColor,
         // foregroundColor: avartForeColor,
          child: Icon(FontAwesomeIcons.quran),
        ),
        title: Text('الباحث القرآني والتفسيري',style: titleStyle,),
        subtitle: Text('فيه بحث عن الآيات وتفسيرها  من كتب التفسير المعتمدة',),
        onTap: () { Navigator.pushNamed(context, '/tafseer'); },
      )) ,

//الحديث    
    Ink(
      color: inkColor,

      child:  ListTile(
        leading: CircleAvatar(
           backgroundColor: avartBackColor,
         // foregroundColor: avartForeColor,
          child: Icon(FontAwesomeIcons.book),
        ),
        title: Text(hadithTITLE,style:titleStyle),
        subtitle: Text(hadithSubTITLE,),
        onTap: () { Navigator.pushNamed(context, hadithSCREENx); },
      )),
    
    //الفتاوى
     Ink(
      color: inkColor,

      child:ListTile(
        leading: CircleAvatar(
          backgroundColor: avartBackColor,
          //foregroundColor: avartForeColor,
          child: Icon(Icons.insert_drive_file),
        ),
        title: Text(fatwaTITLE,style: titleStyle,),
        subtitle: Text(fatwaSubTITLE,),
        onTap: () { Navigator.pushNamed(context, fatwaSCREENx); },
      )),
    
    //مسائل مهمة
    Ink(
      color: inkColor,

      child:ListTile(
        leading: CircleAvatar(
          backgroundColor: avartBackColor,
          //foregroundColor: avartForeColor,
          child: Icon(Icons.border_color),
        ),
        title: Text(importantTITLE,style: titleStyle,),
        subtitle: Text(importantSubTITLE,),
        onTap: () { Navigator.pushNamed(context,importantSCREEENx); },
      )),

//شباب المستقبل
 Ink(
      color: inkColor,

      child:ListTile(
        leading: CircleAvatar(
        backgroundColor: avartBackColor,
          //foregroundColor: avartForeColor,
          child: Icon(Icons.language),
        ),
        title: Text(futureTITLE,style: titleStyle,),
        subtitle: Text(futureSubTITLE,),
        onTap: () { Navigator.pushNamed(context, fatwaSCREENx); },
      )),


      
    
    ],

  ));
}





/* '/zikr': (BuildContext context) => MyPage(title: 'أذكار المسلم الصحيحة'),
        '/tafseer': (BuildContext context) =>MyPage(title: 'الباحث القرآني والتفسيري'),
        '/hadeth': (BuildContext context) => MyPage(title: 'الباحث عن صحة الأحاديث'),
        '/fatwa': (BuildContext context) =>  MyPage(title: 'الباحث عن مسائل شرعية وفتوى موثوقة'),
        '/important': (BuildContext context) => MyPage(title: 'مسائل مهمة لكل مسلم'),
        '/future': (BuildContext context) => MyPage(title: 'شباب المستقبل'), */