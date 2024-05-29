import 'package:flutter/material.dart';
import 'dart:math';
import 'ZeroSumExpressionHomePage.dart';
import 'dart:ui';

class firstpage extends StatefulWidget
{
  _firstpageState createState()=>_firstpageState();
}
class _firstpageState extends State<firstpage> {
  @override
  Color _buttoncolor=Colors.black;
   _onmouseEnter()
  {
    setState(() {
      _buttoncolor=Colors.red;

    });

  }
   _onmouseExit()
  {
    setState(() {
      _buttoncolor=Colors.black;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Balance Brains", style: TextStyle(color: Colors.black,
            fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,),


      body: Stack(
children: <Widget>[
  Container(
      decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/images/puzzle.jpg',),
      fit: BoxFit.cover,
    ),
    ),

    ),
  Container_forbutton(),
  SizedBox(height: 20),
],


    ),
    );
  }

  Container_forbutton()
  {
    return Align(

      alignment: FractionalOffset(0.55,0.95),


        child: InkWell(
          onTap: ()
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ZeroSumExpressionHomePage()),
            );
          },
          onTapDown: (_) => _onmouseEnter,
          onTapCancel: () => _onmouseExit,
          onTapUp: (_) => _onmouseExit,
          child:Container(
              width:100,
              height:60,
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color:Colors.black,
                border:Border.all(
                  color:Colors.black,
                  width:5,
                ),
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Start Puzzle",style:TextStyle(color:Colors.white,fontWeight: FontWeight.bold),)
                ],
              )


        ),
      ),

    );

  }
}