import 'package:flutter/material.dart';
import 'package:peliculas_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          CardSwiper(),

          //Slider de peliculas
          const MovieSlider()
          //Listado horizontal de peliculas
        ],
      ))),
    );
  }
}
