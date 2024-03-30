import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/get_data_model.dart';

Future<Weathers> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=Home().citys&appid=6b4ac0190bc1059d6412c3c8a383beb5'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Weathers.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}