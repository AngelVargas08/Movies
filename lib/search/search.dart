

import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    
    return [
      IconButton(
        onPressed: ()=> query = '', 
        icon: const Icon(Icons.clear_rounded)
        )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    
    return IconButton(
      onPressed: () {
        close(context, null);
      }, 
      icon: Icon(Icons.arrow_back)
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    
    return const Text('Por favor ingrese datos');
  }

  Widget _empyContainer(){
    // ignore: avoid_unnecessary_containers
    return Container(
        child: const Center(
          child: Icon(Icons.movie_creation_outlined, color: Colors.black38,size: 130,),
        ),
      );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    
    if(query.isEmpty){
      return _empyContainer();
    }

    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    moviesProvider.getSuggestionsByQuery(query);
    return StreamBuilder(
      stream: moviesProvider.suggestionStream,
      builder: (_,AsyncSnapshot<List<Movie>> snapshot) {
        if(!snapshot.hasData) return _empyContainer();
          final movies = snapshot.data!;
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (_, index) => _MovieItem(movies[index])
          );
      },
      );
  }

}

class _MovieItem extends StatelessWidget {
  final Movie movie;
  const _MovieItem( this.movie);

  @override
  Widget build(BuildContext context) {

    movie.heroId = 'search-${movie.id}';

    return ListTile(
          leading: Hero(
            tag: movie.heroId!,
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(movie.fullPosterImg),
              width: 60,
              fit: BoxFit.contain,
              ),
          ),
            title: Text(movie.title),
            subtitle: Text(movie.originalTitle),
            onTap: (){
                  Navigator.pushNamed(context, 'details', arguments: movie);
            },
    );
  }
}