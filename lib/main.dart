import 'package:flutter/material.dart';



import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/theme/theme.dart';
import 'package:provider/provider.dart';
import 'screens/screens.dart';



void main() => runApp( const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MoviesProvider(), lazy: false,)
      ],
      child: const MyApp(),
    );
  }
}



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
            'details':( _ ) =>  DetailsScreen(),
      },
      
    );
  }
}