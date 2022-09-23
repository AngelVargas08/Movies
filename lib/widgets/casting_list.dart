
import 'package:flutter/material.dart';

class CastingListScreen extends StatelessWidget {
   
  const CastingListScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Container(
          margin: EdgeInsets.only(bottom: 30),
            width: double.infinity,
            height: 180,
           // color: Colors.red,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => _CastCard()
              ),
      );
}
}



class _CastCard extends StatelessWidget {
  const _CastCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      //color: Colors.green,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'), 
              image: AssetImage('assets/no-image.jpg'),
              height: 140,
              width: 100,
              fit: BoxFit.cover,

              ),
          ),
          const SizedBox(height: 5,),

          const Text('Actor.name asdasdadad',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}