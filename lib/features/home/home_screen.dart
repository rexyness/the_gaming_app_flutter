import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(51, 0, 51, 1.0),
            Color.fromRGBO(51, 51, 153, 1.0),
          ],
        ),
      ),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 24),
          child: Column(
            children: [
              Row(
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
                  CircleAvatar(
                    radius: 25,
                    child: Image.network('https://avatarfiles.alphacoders.com/287/287747.jpg'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
