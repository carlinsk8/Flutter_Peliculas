import 'package:http/http.dart' as http;
import 'package:peliculas/src/models/pelicula_model.dart';
import 'dart:convert';
class PeliculasProvider {
  String _apikey    = 'aa4744316eaa05281834b7de997b8405';
  String _url       = 'api.themoviedb.org';
  String _language  = 'es-ES';

  Future<List<Pelicula>> getEnCines() async {

    final url = Uri.https(_url,'3/movie/now_playing',{
      'api_key' : _apikey,
      'language': _language
    });

    final resp = await http.get(url);

    final decodeData = json.decode(resp.body);

    final pelicula = new Peliculas.fromJsonList(decodeData['results']);
    
    return pelicula.items;

  }
  
}