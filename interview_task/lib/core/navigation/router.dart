
import 'package:flutter/material.dart';
import 'package:interview_task/features/login/prasentation/pages/audio_play_Screen.dart';
import 'package:interview_task/features/login/prasentation/pages/home_see_all_screen.dart';
import 'package:interview_task/core/navigation/route_path.dart' as routes;


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    // case routes.loginRoute:
    //   return MaterialPageRoute(
    //     builder: (context) => LoginPage(),
    //     settings: settings,
    //   );

    case routes.songplayScreen:
      return MaterialPageRoute(
        builder: (context) => SongPlayScreen(),
        settings: settings,
      );
      default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('No path for ${settings.name}'),
          ),
        ),
      );
  }}