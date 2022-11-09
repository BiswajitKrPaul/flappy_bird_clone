import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flappy_bird_clone/game/main_game.dart';

class BackGroundComponent extends ParallaxComponent<MainGame> {
  @override
  Future<void> onLoad() async {
    const layer1 = 'parallax/background_layers/sky.png';
    const layer2 = 'parallax/background_layers/clouds_bg.png';
    const layer3 = 'parallax/background_layers/cloud_lonely.png';
    const layer4 = 'parallax/background_layers/clouds_mg_1.png';
    const layer5 = 'parallax/background_layers/glacial_mountains.png';
    const layer6 = 'parallax/background_layers/clouds_mg_2.png';
    parallax = await gameRef.loadParallax(
      [
        ParallaxImageData(layer1),
        ParallaxImageData(layer2),
        ParallaxImageData(layer3),
        ParallaxImageData(layer4),
        ParallaxImageData(layer5),
        ParallaxImageData(layer6),
      ],
      baseVelocity: Vector2(20, 0),
      velocityMultiplierDelta: Vector2(1.3, 1.5),
      size: size,
    );
  }
}
