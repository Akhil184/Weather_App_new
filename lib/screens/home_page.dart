import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Weather App'),
        backgroundColor:Colors.green,
      ),
      body:Padding(
    padding: EdgeInsets.all(15),
    child:Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          TextField(
           style:TextStyle(

           ),

            decoration:InputDecoration(
              border:OutlineInputBorder(),
                labelText: 'Enter City Name',
                hintText: 'Enter City Name'

            )
            ),
          // RaisedButton(
          //   textColor: Colors.white,
          //   color: Colors.blue,
          //   child: Text('Sign In'),
          //   onPressed: (){},
          // )
        ],
      )
      ),
    );
  }
}
