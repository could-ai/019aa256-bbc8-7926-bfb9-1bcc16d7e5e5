import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class PlatformBlock extends PositionComponent {
  PlatformBlock({required Vector2 position, required Vector2 size}) 
      : super(position: position, size: size);

  @override
  Future<void> onLoad() async {
    add(RectangleComponent(
      size: size,
      paint: Paint()..color = GameColors.backgroundMid,
    ));
    add(RectangleHitbox()..collisionType = CollisionType.passive);
  }
}
