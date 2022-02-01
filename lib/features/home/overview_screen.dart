import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:the_gaming_app/theme/palette.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({Key? key, required this.backgroundImage}) : super(key: key);
  final String backgroundImage;
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
        body: SizedBox(
          height: double.infinity,
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
      ),
    );
  }
}
