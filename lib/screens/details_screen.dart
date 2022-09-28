
import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
   

  
  @override
  Widget build(BuildContext context) {

        //nos captura los argumentos enviados al momento de seleccionar la pelicula
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
            print(movie.title);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
            _CustomAppbar(title: movie.title),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(title: movie.title, originaltitle:
              movie.originalTitle,
              vote: movie.voteAverage,
              ),
              _Overview(overview: movie.overview,),
              _Overview(overview: movie.overview,),
             
             const CastingListScreen(),
           
            ]))
        ],
      )
    );
  }
}

class  _CustomAppbar extends StatelessWidget {
  final String title; 
  const  _CustomAppbar({super.key, 
  required this.title
  });

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
            child: Text(title,
            style: const TextStyle(fontSize: 16),
            ),
          ),
          background: const FadeInImage(
            placeholder: AssetImage('assets/loading.gif'), 
            image: AssetImage('assets/loading.gif'),
            fit: BoxFit.cover,
            ),
      ),
    );
  }
}


class _PosterAndTitle extends StatelessWidget {

    final String title;
    final String originaltitle;
    final double vote;
    const _PosterAndTitle({super.key, 
    required this.title, 
    required this.originaltitle, 
    required this.vote
    });

  @override
  Widget build(BuildContext context) {

      final texttheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'), 
              image: AssetImage('assets/no-image.jpg'),
              height: 150,
              ),
          ),
            const SizedBox(width: 20,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: texttheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2,),
                Text(originaltitle, style: texttheme.subtitle1, overflow: TextOverflow.ellipsis,),
              
              Row(
                  children:  [
                    const Icon(Icons.star_outline, size: 20, color: Colors.grey,),
                    const SizedBox(width: 5,),
                    Text('$vote', style: texttheme.caption,)
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
  final String overview;
  const _Overview({super.key, required this.overview});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(overview,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.subtitle1,
      )

    );
  }
}


