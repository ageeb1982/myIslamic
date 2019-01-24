import 'package:flutter/material.dart';
import 'package:myislamic/constant/reg.dart';
import 'package:myislamic/screen/OtherScreen/MyAppBar.dart';
import 'package:myislamic/screen/Tools/DownloadFile.dart';

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
 bool _dbIsExist;
bool showX=false;
Widget formX;

  bool showProgress=false;

    @override
    void initState() {
         
        quranDBIsExist().then((result) {
            
            setState(() {
                _dbIsExist = result;
            });
        });
    }

  @override
  Widget build(BuildContext context) {
  
  
  
  
  Widget resutlX;
   if(!_dbIsExist)
   {
resutlX =Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(widget.title),
            Text("أضغط على زر التحميل لتنزيل الملفات الرئيسية للمصحف والتفسير "),
             InkWell(
      onTap: () {
        setState(() {
showProgress=true;        
                });
        
      },
      child:  Column(children: <Widget>
      [
        Visibility(child:Icon(Icons.cloud_download,color: Colors.blue,size: 50,) ,visible:!showProgress,),
        Visibility(child:DownloadFileOrg(url:"https://ia601502.us.archive.org/20/items/quranDB/Quran.zip",fileName:"quran.zip",displayName:"القران الكريم",run:showProgress) ,visible:showProgress,)
      ],)

      ,)
        
            ]
    
    )
 
        
            
          
          ),
        );
      
   }
   else
   {
resutlX=GetTafseer();
   }
   
   
   
    return Scaffold(
      appBar: myAppBAR(context),
      body: resutlX
    );
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

  @override
  Widget build(BuildContext context) {
   
    return Center(child: Text('التفسير موجود'),)
    
    
    
    
    
    
    
    ;
  }
}