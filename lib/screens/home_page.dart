import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../http_call/get_data.dart';
import '../models/get_data_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<Weathers> futureAlbums;
TextEditingController city=TextEditingController();
var citys;
  @override
  void initState() {
    super.initState();
    futureAlbums = fetchAlbum();
  }

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
          FutureBuilder<Weathers>(
            future: futureAlbums,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.name ?? '');
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
          TextField(
            controller:city,
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
  citys=city.text;
});
            },
          )
        ),
        ],
      )
      ),
    );
  }
}
