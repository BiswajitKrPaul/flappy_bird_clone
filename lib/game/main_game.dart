import 'package:flame/collisions.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird_clone/components/background_component.dart';
import 'package:flappy_bird_clone/components/bird_component.dart';

class MainGame extends FlameGame with HasCollisionDetection, TapDetector {
  late final BirdComponent _birdComponent;
  @override
  Future<void>? onLoad() {
    add(BackGroundComponent());
    add(_birdComponent = BirdComponent());
    add(ScreenHitbox());
    return null;
  }

  @override
  void onTap() {
    super.onTap();
    _birdComponent.fly();
  }
}
