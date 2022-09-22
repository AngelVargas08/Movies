
import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';

class CardSwiperScreen extends StatelessWidget {
   
  const CardSwiperScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height*0.5,
      //color: Colors.red,
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth: size.width*0.6,
        itemHeight: size.height*0.4,
        itemBuilder: ( _ , index) {
          return  GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: 'movie' ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:  const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'), 
                image: AssetImage('assets/loading.gif'),
                fit: BoxFit.cover,
                
                ),
            ),
          );
        },
        
        ),
    );
  }
}