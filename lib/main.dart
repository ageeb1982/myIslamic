import 'package:flutter/material.dart';
import 'package:myislamic/screen/HomeScreen.dart';
// import 'package:myislamic/screen/MyScoff.dart';
import 'package:myislamic/screen/Intro.dart';
import 'package:myislamic/constant/Constant.dart';
import 'package:myislamic/screen/OtherScreen/MyScoff.dart';
import 'package:myislamic/screen/ZikrScreen/ZikrScreen.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
void main() => runApp(MaterialApp(
      home: IntroScreen(),
            debugShowCheckedModeBanner: false,

      routes: <String, WidgetBuilder>{
       introSCREEN: (BuildContext context) => IntroScreen(),
       homeSCREEN: (BuildContext context) => HomeScreen(),
        zikrSCREEN: (BuildContext context) => ZikrScreen(),
        tafseerSCREEN: (BuildContext context) =>MyPage(title: tafseerTITLE),
        hadethSCREEN: (BuildContext context) => MyPage(title: hadithTITLE),
        fatwaSCREEN: (BuildContext context) =>  MyPage(title: fatwaTITLE),
        importantSCREEEN: (BuildContext context) => MyPage(title: importantTITLE),
        futureSCREEN: (BuildContext context) => MyPage(title: futureTITLE),
      },
    ));

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
         
 
    return myScoff(context);
  }
}

class MyPage extends StatelessWidget {
  MyPage({this.title});
 final String title;
  @override
  Widget build(BuildContext context) {
    return myScoff(context,


      bodyX: Container(
        padding: EdgeInsets.all(50),
        child:Center(child: Column(children: <Widget>[
          Text(title,style:      TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 25),),
 CircleAvatar(minRadius: 100, child:   
 Image.asset("assets/images/setting.png",fit: BoxFit.fill              ),
 ),
      Text("قيد الإنشاء",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 20),),
      ],)),
      )
    );
  }
}
