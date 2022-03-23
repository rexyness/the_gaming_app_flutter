import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:the_gaming_app/features/home/home_screen.dart';
import 'package:the_gaming_app/features/home/overview_screen.dart';
import 'package:the_gaming_app/features/settings/settings_screen.dart';
import 'package:the_gaming_app/models/game_model.dart';
import 'package:the_gaming_app/theme/custom_theme.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'overview',
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: OverviewScreen(
                game: state.extra! as Game,
              ),
              transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
                position: animation.drive(
                  Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).chain(
                    CurveTween(curve: Curves.easeInBack),
                  ),
                ),
                child: child,
              ),
            ),
          ),
          GoRoute(
            path: 'settings',
            
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              fullscreenDialog: true,
              opaque: false,
              key: state.pageKey,
              child: const SettingsScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
                position: animation.drive(
                  Tween<Offset>(
                    begin: const Offset(0, -1),
                    end: Offset.zero,
                  ).chain(
                    CurveTween(curve: Curves.easeIn),

                  ),
                ),
                child: child,
              ),
            ),
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'The Gaming App',
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.darkTheme(context),
    );
  }
}
