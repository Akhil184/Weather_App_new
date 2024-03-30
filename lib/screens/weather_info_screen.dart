import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../http_call/get_data.dart';
import '../models/get_data_model.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
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
    ],
    )
        ),
    );
  }
}
