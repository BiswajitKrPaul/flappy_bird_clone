import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flappy_bird_clone/bloc/game_bloc.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';

class BirdComponent extends SpriteAnimationComponent
    with
        HasGameRef,
        CollisionCallbacks,
        FlameBlocListenable<GameBloc, GameState> {
  final double gravity = 200;

  @override
  Future<void> onLoad() async {
    debugMode = kDebugMode;
    position = (gameRef.size / 2) - Vector2(250, 0);
    size = Vector2.all(60);
    anchor = Anchor.center;
    flipHorizontallyAroundCenter();
    animation = SpriteAnimation.fromFrameData(
      await Flame.images.load('sprites/bird_flying.png'),
      SpriteAnimationData.sequenced(
        amount: 7,
        stepTime: 0.08,
        textureSize: Vector2(46, 30),
      ),
    );
    playing = false;
    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (playing) {
      position.y += gravity * dt;
    }
  }

  @override
  void onNewState(GameState state) {
    if (state.gameStateEnum == GameStateEnum.running) {
      playing = true;
    } else {
      playing = false;
    }
  }

  void fly() {
    add(
      MoveByEffect(
        Vector2(0, -100),
        EffectController(
          duration: 0.2,
          curve: Curves.decelerate,
        ),
      ),
    );
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    bloc.add(GameOver());
    position = (gameRef.size / 2) - Vector2(250, 0);
    animation?.currentIndex = 0;
  }
}
