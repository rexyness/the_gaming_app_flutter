import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_gaming_app/features/home/home_screen.dart';
import 'package:the_gaming_app/theme/custom_theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return MaterialApp(
      title: 'Gaming Trade',
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.darkTheme(context),
      home: const HomeScreen(),
    );
  }
}

