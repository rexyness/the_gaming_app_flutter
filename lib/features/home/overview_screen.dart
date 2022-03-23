import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:the_gaming_app/models/game_model.dart';
import 'package:the_gaming_app/theme/palette.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({Key? key, required this.game}) : super(key: key);
  final Game game;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: Palette.backgroundGradient,
        ),
      ),
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              // title: Text('SliverAppBar'),
                expandedHeight: 250.0,
                title: Text(game.title),
                collapsedHeight: 80,
              stretch: true,
              flexibleSpace: Picture(backgroundImage: game.imageUrl),
            ),
            SliverFixedExtentList(
              itemExtent: 150.0,
              delegate: SliverChildListDelegate(
                [
                  
                  Container(color: Colors.purple),
                  Container(color: Colors.green),
                  Container(color: Colors.purple),
                  Container(color: Colors.green),
                  Container(color: Colors.purple),
                  Container(color: Colors.green),
                  Container(color: Colors.purple),
                  Container(color: Colors.green),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Picture extends StatelessWidget {
  const Picture({
    Key? key,
    required this.backgroundImage,
  }) : super(key: key);

  final String backgroundImage;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(1),
      child: SizedBox(
        height: 350,
        width: double.infinity,
        child: Hero(
          transitionOnUserGestures: true,
          tag: backgroundImage,
          child: CachedNetworkImage(
            imageUrl: backgroundImage,
            imageBuilder: (context, imageProvider) => Container(
              height: 250,
              width: 330,
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(fit: BoxFit.fitHeight, image: imageProvider),
              ),
            ),
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
