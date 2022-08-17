import 'package:flutter/material.dart';
import 'package:peliculas_app/providers/movies_provider.dart';
import 'package:peliculas_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    print(moviesProvider.onDisplayMovies);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cartelera'),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined))
        ],
      ),
      body: Container(
          child: SingleChildScrollView(
              child: Column(
        children: [
          //Tarjetas principales
          CardSwiper(movies: moviesProvider.onDisplayMovies),

          //Slider de peliculas
          const MovieSlider()
          //Listado horizontal de peliculas
        ],
      ))),
    );
  }
}
