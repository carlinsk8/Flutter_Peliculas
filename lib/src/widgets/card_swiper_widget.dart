import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;

  CardSwiper({required this.peliculas});

  @override
  Widget build(BuildContext context) {
    //() => Navigator.pushNamed(context, 'detalle'
    return CarouselSlider.builder(
      itemCount: this.peliculas.length,
      itemBuilder: (
        context,
        i,
        realIndex,
      ) =>
          PosterImage(
        pelicula: peliculas[i],
      ),
      options: CarouselOptions(
        aspectRatio: 2.0,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
    );
  }
}

class PosterImage extends StatelessWidget {
  const PosterImage({
    Key? key,
    required this.pelicula,
  }) : super(key: key);

  final Pelicula pelicula;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'detalle', arguments: pelicula),
      child: Hero(
        tag: pelicula.getBackgroundImg(),
        child: FadeInImage(
          // image: NetworkImage(pelicula.getPosterImg()),
          image: NetworkImage(pelicula.getBackgroundImg()),
          placeholder: AssetImage('assets/img/loading.gif'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
