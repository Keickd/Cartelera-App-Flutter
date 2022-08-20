import 'package:flutter/cupertino.dart';
import 'package:peliculas_app/models/models.dart';
import 'package:peliculas_app/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  const CastingCards({Key? key, required this.movieId}) : super(key: key);

  final int movieId;

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    return FutureBuilder(
      builder: (_, AsyncSnapshot<List<Cast>> snapshot) {
        if (!snapshot.hasData) {
          return Container(
            height: 180,
            constraints: const BoxConstraints(maxWidth: 150),
            child: const CupertinoActivityIndicator(),
          );
        }
        final List<Cast> cast = snapshot.data!;
        return Container(
          width: double.infinity,
          height: 180,
          margin: const EdgeInsets.only(bottom: 30),
          child: ListView.builder(
            itemBuilder: (_, index) => _CastCard(cast: cast[index]),
            itemCount: 10,
            scrollDirection: Axis.horizontal,
          ),
        );
      },
      future: moviesProvider.getMovieCast(movieId),
    );
  }
}

class _CastCard extends StatelessWidget {
  final Cast cast;

  const _CastCard({required this.cast});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                height: 140,
                width: 100,
                fit: BoxFit.cover,
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(cast.fullProfilePath),
              )),
          const SizedBox(height: 5),
          Text(
            cast.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
