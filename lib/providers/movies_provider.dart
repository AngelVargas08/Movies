

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import '../models/models.dart';

class MoviesProvider extends ChangeNotifier{

   String _apiKey = '553173759dbf4fff6690bd6c0917efd8';  
   String _baseUrl = 'api.themoviedb.org';
   String _language = 'es-ES';

   List<Movie> onDisplayMovies = [];
   List<Movie> popularsMovies = [];

  MoviesProvider(){
    print('MoviesProvider iniciailizado');


    getOnDisplayMovies();
    getPopularsMovies();
  }


  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',{
      'api_key' : _apiKey,
      'language' : _language,
      'page' : '1'
    });

      final response = await http.get(url);
      final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

      onDisplayMovies = nowPlayingResponse.results;
      
      notifyListeners();

  }

   getPopularsMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/popular',{
      'api_key' : _apiKey,
      'language' : _language,
      'page' : '1'
    });

      final response = await http.get(url);
      final popularResponse = PopularsResponse.fromJson(response.body);

      popularsMovies = [...popularsMovies, ...popularResponse.results];
      print(popularsMovies[1].title);
      notifyListeners();

  }
}