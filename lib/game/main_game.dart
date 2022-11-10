import 'package:flame/collisions.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flappy_bird_clone/bloc/game_bloc.dart';
import 'package:flappy_bird_clone/components/background_component.dart';
import 'package:flappy_bird_clone/components/bird_component.dart';

class MainGame extends FlameGame with HasCollisionDetection, TapDetector {
  late final BirdComponent _birdComponent;
  final GameBloc gameBloc;

  MainGame(this.gameBloc);

  @override
  Future<void> onLoad() async {
    await add(
      FlameBlocProvider<GameBloc, GameState>.value(
        value: gameBloc,
        children: [
          BackGroundComponent(),
          _birdComponent = BirdComponent(),
          ScreenHitbox()
        ],
      ),
    );
  }

  GameStateEnum get getGameStateEnum => gameBloc.state.gameStateEnum;

  @override
  void onTap() {
    super.onTap();
    if (getGameStateEnum == GameStateEnum.initial ||
        getGameStateEnum == GameStateEnum.over) {
      gameBloc.add(GameStart());
      _birdComponent.fly();
    }
    if (getGameStateEnum == GameStateEnum.running ||
        getGameStateEnum == GameStateEnum.paused) {
      _birdComponent.fly();
    }
  }
}
