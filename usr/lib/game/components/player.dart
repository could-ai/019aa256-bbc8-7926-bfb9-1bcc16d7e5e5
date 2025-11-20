import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart'; // Added for Paint class
import '../echoes_game.dart';
import '../../utils/constants.dart';

class AriaPlayer extends PositionComponent with HasGameRef<EchoesGame>, CollisionCallbacks {
  
  // Physics
  final double _gravity = 1000.0;
  final double _jumpForce = -500.0;
  final double _moveSpeed = 200.0;
  Vector2 velocity = Vector2.zero();
  bool isOnGround = false;
  
  // Visuals (Placeholder for Sprite)
  late RectangleComponent _body;

  AriaPlayer() : super(size: Vector2(40, 60), position: Vector2(100, 100));

  @override
  Future<void> onLoad() async {
    // Placeholder Graphics: White/Blue rectangle representing Aria
    _body = RectangleComponent(
      size: size,
      paint: Paint()..color = GameColors.modernNeon,
    );
    add(_body);
    
    // Hitbox for collision
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    
    // Apply Gravity
    velocity.y += _gravity * dt;
    
    // Apply Velocity
    position += velocity * dt;
    
    // Basic Floor Collision (Hardcoded for prototype, will use collision detection later)
    // This is a fallback if collision fails, ensuring player doesn't fall forever
    if (position.y > gameRef.size.y - 50 - height) {
      position.y = gameRef.size.y - 50 - height;
      velocity.y = 0;
      isOnGround = true;
    }
  }

  void move(JoystickDirection direction, Vector2 delta) {
    if (direction == JoystickDirection.left || direction == JoystickDirection.upLeft || direction == JoystickDirection.downLeft) {
      velocity.x = -_moveSpeed;
      scale.x = -1; // Face left (flip)
      if (scale.x < 0) {
         // Fix position shift when flipping if needed
      }
    } else if (direction == JoystickDirection.right || direction == JoystickDirection.upRight || direction == JoystickDirection.downRight) {
      velocity.x = _moveSpeed;
      scale.x = 1; // Face right
    } else {
      velocity.x = 0;
    }
  }

  void jump() {
    if (isOnGround) {
      velocity.y = _jumpForce;
      isOnGround = false;
    }
  }

  void attack() {
    // Visual feedback for attack
    _body.paint.color = GameColors.primaryPurple;
    Future.delayed(const Duration(milliseconds: 200), () {
      _body.paint.color = GameColors.modernNeon;
    });
  }
}
