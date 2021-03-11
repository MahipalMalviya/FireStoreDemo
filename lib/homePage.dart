import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomePage extends StatefulWidget {
  final String _userName;
  HomePage(this._userName);

  @override
  State<StatefulWidget> createState() => _HomePageState(_userName);

}

class _HomePageState extends State<HomePage> {
  final String _userName;
  _HomePageState(this._userName){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Neumorphic(
          style: NeumorphicStyle(
              color: Colors.black26,
              shape: NeumorphicShape.concave,boxShape: NeumorphicBoxShape.rect(),
              shadowDarkColor: Colors.black26
          ),
          child: Center(
            child: NeumorphicText(
              'Welcome $_userName',
              style: NeumorphicStyle(
                  color: Colors.black26,
                  shape: NeumorphicShape.concave,boxShape: NeumorphicBoxShape.rect(),
                  shadowDarkColor: Colors.black26
              ),
              textStyle: NeumorphicTextStyle(
                fontSize: 18,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
  
  
}