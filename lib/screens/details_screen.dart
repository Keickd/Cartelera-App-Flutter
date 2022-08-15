import 'package:flutter/material.dart';
import 'package:peliculas_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Todo : cambiar por instancia de movie

    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(),
        SliverList(
            delegate: SliverChildListDelegate([
          _PosterAndTitle(),
          _Overview(),
          _Overview(),
          _Overview(),
          CastingCards()
        ]))
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
            color: Colors.black12,
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 10),
            child: const Text(
              'movie.title',
              style: TextStyle(fontSize: 16),
            )),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/300x400'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/200x300'),
              height: 150,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('movie.titulo',
                  style: textTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2),
              Text('movie.originalTitle',
                  style: textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1),
              Row(
                children: [
                  const Icon(
                    Icons.star_outline,
                    size: 15,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'movie.voteAverage',
                    style: textTheme.caption,
                  )
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
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Text(
            'Velit ullamco cupidatat dolore mollit. Consectetur amet aliquip sint nulla. Nisi enim in ut eu tempor incididunt quis ullamco occaecat. Esse officia proident et enim labore aute id. Est aute Lorem mollit veniam deserunt et laboris anim. Mollit veniam incididunt nulla nostrud veniam incididunt veniam culpa nisi tempor voluptate dolore. Est tempor adipisicing voluptate non nisi nisi laborum culpa esse occaecat enim nulla consequat cillum.',
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.subtitle1));
  }
}
