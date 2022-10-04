
import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
   

  
  @override
  Widget build(BuildContext context) {

        //nos captura los argumentos enviados al momento de seleccionar la pelicula
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
            

    return Scaffold(
      body: CustomScrollView(
        slivers: [
            _CustomAppbar(movie),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(movie),
              _Overview(movie),
              _Overview(movie),
             
              CastingListScreen(movie.id),
           
            ]))
        ],
      )
    );
  }
}

class  _CustomAppbar extends StatelessWidget {
  
  final Movie movie;
  const  _CustomAppbar(
    this.movie
  );

  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 250,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(10),
          title: Container(
            width : double.infinity,
            alignment: Alignment.bottomCenter,
            color: Colors.black12,
            child: Text(movie.title,
            style: const TextStyle(fontSize: 16),
            ),
          ),
          background:  FadeInImage(
            placeholder: const AssetImage('assets/loading.gif'), 
            image: NetworkImage(movie.fullbackdropPath),
            fit: BoxFit.cover,
            ),
      ),
    );
  }
}


class _PosterAndTitle extends StatelessWidget {

    final Movie movie;
    const _PosterAndTitle(
      this.movie 
     
    );

  @override
  Widget build(BuildContext context) {

      final texttheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child:  FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'), 
                image: NetworkImage(movie.fullPosterImg),
                height: 150,
                ),
            ),
          ),
            const SizedBox(width: 20,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title, style: texttheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2,),
                Text(movie.originalTitle, style: texttheme.subtitle1, overflow: TextOverflow.ellipsis,),
              
              Row(
                  children:  [
                    const Icon(Icons.star_outline, size: 20, color: Colors.grey,),
                    const SizedBox(width: 5,),
                    Text('${movie.voteAverage}', style: texttheme.caption,)
                  ],
              )
              ],
            )
        ],
      ),

    );
  }
}


class _Overview extends StatelessWidget {
  final Movie movie;
  const _Overview( this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(movie.overview,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.subtitle1,
      )

    );
  }
}


