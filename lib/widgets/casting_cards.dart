import 'package:flutter/material.dart';

class CastingCards extends StatelessWidget {
  const CastingCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      margin: EdgeInsets.only(bottom: 30),
      child: ListView.builder(
        itemBuilder: (_, index) => _CastCard(),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class _CastCard extends StatelessWidget {
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
              child: const FadeInImage(
                height: 140,
                width: 100,
                fit: BoxFit.cover,
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage('https://via.placeholder.com/150x300'),
              )),
          const SizedBox(height: 5),
          const Text(
            'actor.name asdadssadad',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
