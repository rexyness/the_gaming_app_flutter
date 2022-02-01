import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:the_gaming_app/features/home/overview_screen.dart';
import 'package:the_gaming_app/models/game_model.dart';
import 'package:the_gaming_app/theme/assets_class.dart';
import 'package:the_gaming_app/theme/palette.dart';
import 'widgets/game_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const gameImageLists = [
    Game(
      title: 'Doom Eternal',
      followers: 5,
      imageUrl: 'https://cdn.mos.cms.futurecdn.net/Kuuyu5VZoVxqZxy48swupn-1200-80.jpg',
    ),
    Game(
      title: "Watch Dogs Legion",
      followers: 30,
      imageUrl:
          "https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/179485824/original/72747d6da357866c22d9225e5db5d056fd182441/design-high-quality-clean-and-gaming-wallpapers-of-your-name.png",
    ),
    Game(
      title: "Super Mario",
      followers: 60,
      imageUrl:
          "https://static.wikia.nocookie.net/ssb/images/d/d8/WiiU_SuperSmashBros_Stage07_Screen_01.jpg/revision/latest?cb=20140409191328",
    ),
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: Palette.backgroundGradient,
        ),
      ),
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //App Bar
            const HomeAppBar(),
            const SizedBox(
              height: 25,
            ),
            //Featured Cards
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                'Featured',
                textAlign: TextAlign.left,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const FeaturedList(gameImageLists: gameImageLists),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}

class FeaturedList extends StatelessWidget {
  const FeaturedList({
    Key? key,
    required this.gameImageLists,
  }) : super(key: key);

  final List<Game> gameImageLists;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: SizedBox(
        height: 250,
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            width: 15,
          ),
          shrinkWrap: true,
          itemCount: gameImageLists.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            if (index == gameImageLists.length - 1) {
              return Row(
                children: [
                  GameCard(game: gameImageLists[index]),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              );
            }
            return GameCard(game: gameImageLists[index]);
          },
        ),
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);
  static const kRadius = 25.0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: kRadius,
            backgroundColor: Colors.white12,
            child: IconButton(
              splashRadius: kRadius,
              icon: Image.asset(
                Assets.menuIconPath,
                height: kRadius,
                color: Colors.white,
              ),
              // icon: const Icon(
              //   Icons.menu_sharp,
              //   color: Colors.white,
              // ),
              onPressed: () {},
            ),
          ),
          const CircleAvatar(
            radius: kRadius,
            backgroundImage: NetworkImage('https://avatarfiles.alphacoders.com/287/287747.jpg'),
          ),
        ],
      ),
    );
  }
}
