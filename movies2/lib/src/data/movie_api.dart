import 'dart:convert';
import '../modules/movie.dart';
import 'package:http/http.dart';
import '../modules/movie.dart';

class MovieApi{

  MovieApi(this._client);
  final Client _client;

  Future<List<Movie>> getMovies(int page) async{

    //accesam API-ul
    final Response response = await get(
        Uri.parse('https://yts.mx/api/v2/list_movies.json?quality=3D&page=$page'));

    //transformam raspunsul conexiunii (JSON) intr o mapa de tip String (keys) si dynamic (avem si map,set,alte tipuri de date ca si valoare)
    final Map<String, dynamic> result = jsonDecode(response.body) as Map<String, dynamic>;

    final List<Movie> data = <Movie>[];
    //lista de filme din rezultat
    if(result['data']['movies'] != null) {
      final List<dynamic> movies = result['data']['movies'] as List<dynamic>;

      for (int i = 0; i < movies.length; i++) {
        final Map<String, dynamic> item = movies[i] as Map<String, dynamic>;
        data.add(Movie.fromJson(item));
      }
    }

    return data;
  }


}