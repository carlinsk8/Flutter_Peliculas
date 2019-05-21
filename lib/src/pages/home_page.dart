import 'package:flutter/material.dart';
import 'package:peliculas/src/widgets/_swiper_widget.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';
class HomePage extends StatelessWidget {

  final peliculasProvider = new PeliculasProvider();  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Peliculas'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          ),
          
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _swiperTarjetas(),
          ],
        ),
      ),
    );
  }

  Widget _swiperTarjetas() {
     
    return FutureBuilder(
      future: peliculasProvider.getEnCines(),
      builder: (BuildContext contex, AsyncSnapshot<List> snapshot){

        if(snapshot.hasData){
          return CardSwiper(
            peliculas: snapshot.data,
          );
        }else{
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator()
            )
          );
        }
      },
    );
  }
}