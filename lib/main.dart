import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird_clone/bloc/game_bloc.dart';
import 'package:flappy_bird_clone/game/main_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setLandscapeLeftOnly();

  final gameBloc = GameBloc();

  final mainGame = MainGame(gameBloc);

  runApp(
    BlocProvider(
      create: (context) => gameBloc,
      child: GameWidget(game: mainGame),
    ),
  );
}
