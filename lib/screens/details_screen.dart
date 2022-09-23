
import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
   
  const DetailsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const  _CustomAppbar(),
          SliverList(
            delegate: SliverChildListDelegate([
             const _PosterAndTitle(),
             const _Overview(),
             const _Overview(),
                   CastingListScreen(),
           
            ]))
        ],
      )
    );
  }
}

class  _CustomAppbar extends StatelessWidget {
  const  _CustomAppbar({super.key});

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
            child: const Text('movie.title',
            style: TextStyle(fontSize: 16),
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


    const _PosterAndTitle({super.key});

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
                Text('movie.title',style: texttheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2,),
                Text('movie.originalTitle',style: texttheme.subtitle1, overflow: TextOverflow.ellipsis,),
              
              Row(
                  children:  [
                    const Icon(Icons.star_outline, size: 20, color: Colors.grey,),
                    const SizedBox(width: 5,),
                    Text('movie.voteAverage', style: texttheme.caption,)
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
  const _Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text('Sint esse fugiat eiusmod est eiusmod laboris consequat adipisicing. Amet elit Lorem dolore veniam. Veniam labore mollit deserunt nulla fugiat adipisicing aliqua esse. Elit minim sint consequat aliqua consequat nostrud eiusmod mollit nisi adipisicing labore adipisicing proident ex. Deserunt dolor cillum commodo ullamco non sit reprehenderit ad quis aliqua veniam reprehenderit non voluptate. Enim esse velit ullamco enim anim aliquip non do irure deserunt. Ea id minim sint commodo reprehenderit laborum dolore ad mollit labore irure velit.',
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.subtitle1,
      )

    );
  }
}


