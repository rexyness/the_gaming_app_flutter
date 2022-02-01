import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:the_gaming_app/theme/palette.dart';

import '../overview_screen.dart';

class GameCard extends HookConsumerWidget {
  final String backgroundImage;
  final String title;
  final int followersCount;
  const GameCard({
    Key? key,
    required this.backgroundImage,
    required this.title,
    required this.followersCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _textAnimationController = useAnimationController(
      duration: const Duration(seconds: 1),
      
      lowerBound: 0.0,
      upperBound: 1.0,
      
    );
    const kCardHeight = 250.0;

    final opacityText = useState(0.0);

    _textAnimationController.addListener(() {
      opacityText.value = _textAnimationController.value;
    });
    _textAnimationController.forward();
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => OverviewScreen(
              backgroundImage: backgroundImage,
            ),
          ),
        )
            .whenComplete(() {
          _textAnimationController.reset();
          // Future.delayed(const Duration(seconds: 3)).then((_) => _textAnimationController.forward());
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: SizedBox(
          height: kCardHeight,
          width: 330,
          child: Stack(
            children: [
              // Image
              Hero(
                transitionOnUserGestures: true,
                tag: backgroundImage,
                child: CachedNetworkImage(
                  imageUrl: backgroundImage,
                  imageBuilder: (context, imageProvider) => Container(
                    height: kCardHeight,
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
              // Gradient
              AnimatedBuilder(
                animation: _textAnimationController,
                builder: (context, child) => Opacity(
                  opacity: opacityText.value,
                  child: child,
                ),
                child: Container(
                  height: kCardHeight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Palette.gradientPurple.withOpacity(0.0),
                        Colors.black.withOpacity(0.99),
                      ],
                      stops: const [0.2, 1],
                    ),
                  ),
                ),
              ),
              //Text
              Positioned(
                child: AnimatedBuilder(
                  animation: _textAnimationController,
                  builder: (context, child) => Opacity(
                    opacity: opacityText.value,
                    child: child,
                  ),
                  child: SizedBox(
                    height: kCardHeight,
                    width: 300,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '$followersCount followers',
                          textAlign: TextAlign.start,
                        )
                      ],
                    ),
                  ),
                ),
                bottom: 25,
                left: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
