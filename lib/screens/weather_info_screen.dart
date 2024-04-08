import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newton_particles/newton_particles.dart';
import 'package:video_player/video_player.dart';
import '../http_call/get_data.dart';
import '../models/get_data_model.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late VideoPlayerController _controller;
  late Future<Weathers> futureAlbums;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
       ''))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    futureAlbums = fetchAlbum();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.blueGrey,
        appBar:AppBar(
          title:Text('Weather App'),
          centerTitle:true,
          backgroundColor:Colors.green,
        ),
        // body:Newton(
        //   // Add any kind of effects to your UI
        //   // For example:
        //   activeEffects: [
        //     RainEffect(
        //       particleConfiguration: ParticleConfiguration(
        //         shape: CircleShape(),
        //         size: const Size(5, 5),
        //         color: const SingleParticleColor(color: Colors.black),
        //       ),
        //       effectConfiguration: const EffectConfiguration(),
        //     )
        //   ],
        // ),
      body:VideoPlayer(_controller),
      //   Card(
      //     color:Colors.lightBlue[200],
      //           child:Column(
      //             mainAxisAlignment:MainAxisAlignment.start,
      //             crossAxisAlignment:CrossAxisAlignment.start,
      //             children: [
      //               Padding(padding: new EdgeInsets.all(10.0),
      //             child:Text('Hourly Forecast'),
      // ),
      //               Padding(padding: new EdgeInsets.all(10.0),
      //             child:Row(
      //               mainAxisAlignment:MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Text('Temp',style:TextStyle(color:Colors.white)),
      //                   // Text({{snapshot.}},style:TextStyle(color:Colors.white)),
      //                     Text('8 Am ',style:TextStyle(color:Colors.white)),
      //                 Text('9 Am ',style:TextStyle(color:Colors.white)),
      //                 Text('10 Am ',style:TextStyle(color:Colors.white)),
      //
      //               ],
      //             ),
      //           ),
      // ],
      //   ),
        //     if(snapshot.data!.weather![0].description=='clear sky')
        //   Image.asset('assets/images/clear_sky.jpeg',fit:BoxFit.cover,height:650,),
        // if(snapshot.data!.weather![0].description=='haze')
        //   Image.asset('assets/images/haze.jpeg',fit:BoxFit.cover,height:650,),
        // if(snapshot.data!.weather![0].description=='scattered clouds')
        //   Image.asset('assets/images/scatted_cloud.webp',fit:BoxFit.cover,height:650),
        // if(snapshot.data!.weather![0].description=='overcast clouds')
        //   Image.asset('assets/images/overcast.webp',fit:BoxFit.cover,height:650,),
        // if(snapshot.data!.weather![0].description=='mist')
        //   Image.asset('assets/images/mist.jpeg',fit:BoxFit.cover,height:650,),
        // if(snapshot.data!.weather![0].description=='broken clouds')
        //   Image.asset('assets/images/scattred_cloud.webp',fit:BoxFit.cover,height:650,),
        // if(snapshot.data!.weather![0].description=='few clouds')
        //   Image.asset('assets/images/few_clouds.jpeg',fit:BoxFit.cover,height:650,),
      // Padding(padding: new EdgeInsets.all(0.0),
      // child:Text(snapshot.data!.weather![0].description ?? '',style:TextStyle(fontSize:20),),
      // ),

    //   ),
    //   ],
    //   ),
    //   );
    // } else if (snapshot.hasError) {
    // return Text('${snapshot.error}');
    // }
    //
    // // By default, show a loading spinner.
    // return const CircularProgressIndicator();
    // },
    // ),
    );
  }
}
