import 'package:flutter/material.dart';
import 'MyAppBar.dart';
import 'MyDrawer.dart';

Scaffold myScoff(BuildContext context,{Widget bodyX}){
Scaffold scoff=new Scaffold(
 
//drawer: myDrawer(),
appBar: myAppBAR(context),

body:bodyX==null?getBody():bodyX ,
backgroundColor: Colors.blue[50],
endDrawer: myDrawer(context),

);




return scoff;
}




  Widget getBody()
{
Center center=Center(

  child:  GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this would produce 2 rows.
          crossAxisCount: 3,
          // Generate 100 Widgets that display their index in the List
          children: List.generate(100, (index) {
            return Card(
              child: Text(
                'Item $index',

                style: TextStyle(color: Colors.deepPurpleAccent),),
              );}
)));

return center;
}



