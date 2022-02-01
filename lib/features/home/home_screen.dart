import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_gaming_app/models/game_model.dart';
import 'package:the_gaming_app/theme/palette.dart';

import 'widgets/game_card.dart';

class HomeScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    Game x = const Game(title: "title", followers: 3, imageUrl: "imageUrl");
    x.copyWith(imageUrl: "xx");
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: Palette.backgroundGradient,
        ),
      ),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //App Bar
              const HomeAppBar(),
              const SizedBox(
                height: 25,
              ),
              //Featured Cards
              Text(
                'Featured',
                textAlign: TextAlign.left,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 250,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 15,
                  ),
                  shrinkWrap: true,
                  itemCount: gameImageLists.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GameCard(
                      backgroundImage: gameImageLists[index].imageUrl,
                      followersCount: gameImageLists[index].followers,
                      title: gameImageLists[index].title,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white12,
          child: IconButton(
            icon: const Icon(
              Icons.menu_sharp,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
        const CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage('https://avatarfiles.alphacoders.com/287/287747.jpg'),
        ),
      ],
    );
  }
}
