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
        body:FutureBuilder<Weathers>(
    future: futureAlbums,
    builder: (context, snapshot) {
    if (snapshot.hasData) {
    return  Padding(padding: new EdgeInsets.all(10.0),
      child:Column(
      children: [
        if(snapshot.data!.weather![0].description=='clear sky')
          Image.asset('assets/images/clear_sky.jpeg',height:100,),
        if(snapshot.data!.weather![0].description=='haze')
          Image.asset('assets/images/haze.jpeg'),
        if(snapshot.data!.weather![0].description=='scattered clouds')
          Image.asset('assets/images/scatted_cloud.webp'),
        if(snapshot.data!.weather![0].description=='overcast clouds')
          Image.asset('assets/images/overcast.webp'),
        if(snapshot.data!.weather![0].description=='mist')
          Image.asset('assets/images/mist.jpeg',),
        if(snapshot.data!.weather![0].description=='broken clouds')
          Image.asset('assets/images/scattred_cloud.webp',fit:BoxFit.cover,height:650,),
        if(snapshot.data!.weather![0].description=='few clouds')
          Image.asset('assets/images/few_clouds.jpeg',fit:BoxFit.cover,height:650,),
      Padding(padding: new EdgeInsets.all(0.0),
      child:Text(snapshot.data!.weather![0].description ?? '',style:TextStyle(fontSize:20),),
      ),

      ]
      ),
      );
    } else if (snapshot.hasError) {
    return Text('${snapshot.error}');
    }

    // By default, show a loading spinner.
    return const CircularProgressIndicator();
    },
    ),
    );
  }
}
