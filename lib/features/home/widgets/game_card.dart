import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_gaming_app/theme/palette.dart';

class GameCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    const kCardHeight = 250.0;
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: SizedBox(
        height: kCardHeight,
        width: 330,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: NetworkImage(
                    backgroundImage,
                  ),
                ),
              ),
              height: kCardHeight,
            ),
            Container(
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
            Positioned(
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
                    const SizedBox(height: 10,),
                    Text('$followersCount followers' ,textAlign: TextAlign.start,)
                  ],
                ),
              ),
              bottom: 25,
              left: 20,
            )
          ],
        ),
      ),
    );
  }
}
