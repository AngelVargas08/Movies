
import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

class CardSwiperScreen extends StatelessWidget {
   
  final List<Movie> movies;

  const CardSwiperScreen({
    super.key, 
    required this.movies
    });
  
  @override
  Widget build(BuildContext context) {


    

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height*0.5,
      //color: Colors.red,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width*0.6,
        itemHeight: size.height*0.7,
        itemBuilder: ( _ , index) {

          final movie = movies[index]; 
          print(movie.posterPath);

          return  GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: 'movie' ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:  FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'), 
                image: NetworkImage(movie.fullPosterImg),
                fit: BoxFit.cover,
                
                ),
            ),
          );
        },
        
        ),
    );
  }
}