
import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/search/search.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

      final moviesProvider = Provider.of<MoviesProvider>(context);
      

    return  Scaffold(
      appBar:  AppBar(
        title: const Center(
          child: Text('Peliculas en cines')),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () => showSearch(
              context: context, 
              delegate: MovieSearchDelegate()
              ), 
            )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          
       children:  [
        const Padding(padding: EdgeInsets.only(top: 10)),
        //Tarjeta principal
        CardSwiperScreen(movies: moviesProvider.onDisplayMovies,),
        //
        MovieScreen(movies: moviesProvider.popularsMovies,
         title: 'Populares',
         onNextPage: () => moviesProvider.getPopularsMovies(),
         ),


       ],
      ),
      )
    );
  }
}