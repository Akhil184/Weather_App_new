import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/screens/weather_info_screen.dart';

import '../http_call/get_data.dart';
import '../models/get_data_model.dart';

class Home extends StatefulWidget {
  TextEditingController city=TextEditingController();
  var citys;
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Weather App'),
        centerTitle:true,
        backgroundColor:Colors.green,
      ),
      body:Padding(
    padding: EdgeInsets.all(15),
    child:Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          TextField(
            controller:widget.city,
           style:TextStyle(

           ),

            decoration:InputDecoration(
              border:OutlineInputBorder(),
                labelText: 'Enter City Name',
                hintText: 'Enter City Name'

            )
            ),
        Padding(
          padding: EdgeInsets.only(top:30),
      child:ElevatedButton(
        style:ElevatedButton.styleFrom(backgroundColor:Colors.green),
            child: Text('Submit',style:TextStyle(color:Colors.black),),
            onPressed: (){
setState(() {
  widget.citys=widget.city.text;
});
Navigator.push(context,
    MaterialPageRoute(builder: (context) => WeatherScreen()));
            },
          )
        ),
        ],
      )
      ),
    );
  }
}
