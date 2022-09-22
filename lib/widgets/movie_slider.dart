

import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
   
  const MovieScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 260,
        //color: Colors.red,
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.only(left: 20, bottom: 4),
            child: Text('Populares', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold ),),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (_, index) => const _MoviePoster(),
                ),
            )
          ],
        ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({super.key});

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
              child: const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'), 
                image: AssetImage('assets/no-image.jpg'),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
                ),
            ),
          ),
            const SizedBox(height: 5,),

            const Text('Starwars: El retorno del nuevo jedi silvestre dangong',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            )
        ],
       ),
     );
  }
}