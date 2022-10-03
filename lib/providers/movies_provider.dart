



import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import '../models/models.dart';

class MoviesProvider extends ChangeNotifier{

   final String _apiKey = '553173759dbf4fff6690bd6c0917efd8';  
   final String _baseUrl = 'api.themoviedb.org';
   final String _language = 'es-ES';

   List<Movie> onDisplayMovies = [];
   List<Movie> popularsMovies = [];
   Map<int, List<Cast>> movieCast = {};

   int _popularPage = 0;

  MoviesProvider(){
  
    getOnDisplayMovies();
    getPopularsMovies();
  }
      //optmiza el codigo de peticion
  Future<String> _getJsonData (String endpoint, [int page = 1] )async{
      var url = Uri.https(_baseUrl, endpoint,{
      'api_key' : _apiKey,
      'language' : _language,
      'page' : '1'
    });

      final response = await http.get(url);
      return response.body;
  }


  getOnDisplayMovies() async {
   
      final jsonData = await _getJsonData('3/movie/now_playing');
      final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

      onDisplayMovies = nowPlayingResponse.results;
      
      notifyListeners();

  }

   getPopularsMovies() async {
    _popularPage++;
      final jsonData = await _getJsonData('3/movie/popular', _popularPage);
      final popularResponse = PopularsResponse.fromJson(jsonData);

      popularsMovies = [...popularsMovies, ...popularResponse.results];
      
      notifyListeners();

  }

    Future<List<Cast>> getMoviesCast(int movieId)async{

        //este condicional evalua el id para no realizar peticiones al servidor
      if (movieCast.containsKey(movieId)){
              return movieCast[movieId]!;
      }
      

        final jsonData = await _getJsonData('3/movie/$movieId/credits');
        final creditsResponse = CreditsResponse.fromJson(jsonData);

        movieCast[movieId] = creditsResponse.cast;

      return creditsResponse.cast;
    }

}