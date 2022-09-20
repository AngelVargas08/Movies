import 'package:flutter/material.dart';
import 'package:peliculas/theme/theme.dart';


import 'screens/screens.dart';



void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peliculas',
      debugShowCheckedModeBanner: false,
      theme: Apptheme.lightTheme,
      initialRoute: 'home',
      routes: {
            'home'   :( _ ) => const HomeScreen(),
            'details':( _ ) => const DetailsScreen(),
      },
      
    );
  }
}