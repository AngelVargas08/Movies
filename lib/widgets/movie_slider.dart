

import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';

class MovieScreen extends StatefulWidget {

   final List<Movie> movies;
   final String? title;
   final Function onNextPage;

  const MovieScreen({Key? key,
  required this.movies, 
  this.title, 
  required this.onNextPage
  }) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {

  final  ScrollController scrollController = ScrollController();

@override
void initState() {
  super.initState();

  scrollController.addListener(() { 
      if(scrollController.position.pixels >= scrollController.position.maxScrollExtent - 500){
          widget.onNextPage();
      }

  });
  
}

@override
  void dispose() {
     
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 260,
        //color: Colors.red,
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(widget.title != null)
             Padding(padding: const EdgeInsets.only(left: 20, bottom: 4),
            child: Text( widget.title! , style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold ),),
            ),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: widget.movies.length,
                itemBuilder: ( _ , index) =>  _MoviePoster(widget.movies[index])
                ),
            )
          ],
        ),
    );
  }
}

class _MoviePoster extends StatelessWidget {

  final Movie movie; 

  const _MoviePoster( this.movie);

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
            onTap: () => Navigator.pushNamed(context, 'details', arguments: movie ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:  FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'), 
                image: NetworkImage(movie.fullPosterImg),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
                ),
            ),
          ),
            const SizedBox(height: 5,),

             Text('${movie.title} ${movie.overview}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            )
        ],
       ),
     );
  }
}