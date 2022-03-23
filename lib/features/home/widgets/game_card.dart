import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:the_gaming_app/models/game_model.dart';
import 'package:the_gaming_app/theme/palette.dart';


class GameCard extends HookConsumerWidget {
  final Game game;
  const GameCard({
    Key? key,
    required this.game,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final opacityText = useState(0.0);
    final _textAnimationController = useAnimationController(
      duration: const Duration(milliseconds: 750),
      lowerBound: 0.0,
      upperBound: 1.0,
    )..forward();
    const kCardHeight = 250.0;

    _textAnimationController.addListener(() {
      opacityText.value = _textAnimationController.value;
    });

    return GestureDetector(
      onTap: () {
        context.go('/overview', extra: game);
        _textAnimationController.reset();
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
                tag: game.imageUrl,
                child: CachedNetworkImage(
                  imageUrl: game.imageUrl,
                  imageBuilder: (context, imageProvider) => Container(
                    height: kCardHeight,
                    width: 330,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(fit: BoxFit.fitHeight, image: imageProvider),
                    ),
                  ),
                  placeholder: (context, url) => Container(
                    height: kCardHeight,
                    width: 330,
                    child: const Center(child: SizedBox(width: 25, height: 25, child: CircularProgressIndicator())),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                    ),
                  ),
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
                          game.title,
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
                          '${game.followers} followers',
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
