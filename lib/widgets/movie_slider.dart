

import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';

class MovieScreen extends StatelessWidget {

   final List<Movie> movies;
   final String? title;

  const MovieScreen({Key? key,
  required this.movies, 
  this.title
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 260,
        //color: Colors.red,
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(title != null)
             Padding(padding: const EdgeInsets.only(left: 20, bottom: 4),
            child: Text( title! , style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold ),),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: ( _ , index) =>  _MoviePoster(movies[index])
                ),
            )
          ],
        ),
    );
  }
}

class _MoviePoster extends StatelessWidget {

  final Movie moviex; 

  const _MoviePoster( this.moviex);

  @override
  Widget build(BuildContext context) {
    return Container(
       width: 130,
       height: 190,
       //color: Colors.black,
       margin: const EdgeInsets.symmetric(horizontal: 10),
       child: Column(
        children:  [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: 'movie' ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:  FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'), 
                image: NetworkImage(moviex.fullPosterImg),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
                ),
            ),
          ),
            const SizedBox(height: 5,),

             Text('${moviex.title} ${moviex.overview}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            )
        ],
       ),
     );
  }
}