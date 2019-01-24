import 'package:flutter/material.dart';
//import 'package:myislamic/model/Item.dart';
import 'package:myislamic/model/ZCat.dart';
import 'package:myislamic/screen/ZikrScreen/ZikrGridItemDetails.dart';

class ZikrList extends StatelessWidget {
  final ZCat item;

  const ZikrList({@required this.item});

  @override
  Widget build(BuildContext context)
   {
    return 
     InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ZikrGridItemDetails(this.item),
          ),
        );
      },
      child: 
      Card(
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          //  CircleAvatar(
          //    child:
              AspectRatio(

              aspectRatio: 18.0 / 12.0,
              child:
              //
                   Image.asset(
               "assets/images/"+(item.icon==null?"quran2.png":item.icon),
                fit: BoxFit.cover,
              ),
              ),
           // ),
            //    CircleAvatar(
                  
            //   child:  Image.asset(
            //    "assets/images/"+(item.icon==null?"quran2.png":item.icon),
            //     fit: BoxFit.fill,
            //   ),
            // ),
            new Padding(
              padding: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                 Center(child:  Text(
                    item.txt,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xFFD73C29),
                      fontWeight: FontWeight.bold,
                    ),
                  ) )
                  //,
                  //SizedBox(height: 0.0),
                   //SizedBox(height: 2.0)                           
                  
                ]
                          
                        
                     
             
       
      ),
    )]
        )
      )
    );
  }
}
