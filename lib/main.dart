import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird_clone/game/main_game.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setLandscapeLeftOnly();

  final mainGame = MainGame();

  runApp(GameWidget(game: mainGame));
}
