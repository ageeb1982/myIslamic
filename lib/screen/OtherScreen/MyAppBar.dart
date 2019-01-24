import 'package:flutter/material.dart';
import 'package:myislamic/constant/Constant.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';


AppBar myAppBAR(BuildContext context)
{
AppBar appbar=new AppBar(
      backgroundColor: Colors.blue[200],
      // ThemeData(primaryColor: Colors.red),
title: Text(appName),
leading: IconButton(icon: Icon(FontAwesomeIcons.home),onPressed: (){ Navigator.pushNamed(context, homeSCREEN);},),
);

return appbar;

}




 