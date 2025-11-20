import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/geometry.dart'; // For Rectangle
import '../utils/constants.dart';
import 'components/player.dart';
import 'components/platform.dart';

class EchoesGame extends FlameGame with HasKeyboardHandlerComponents, HasCollisionDetection {
  late AriaPlayer player;
  late JoystickComponent joystick;
  
  // Game State
  double energy = 100.0;
  double health = 100.0;

  @override
  Color backgroundColor() => GameColors.backgroundDark;

  @override
  Future<void> onLoad() async {
    // 1. Setup World/Level (Modern Era Placeholder)
    add(PlatformBlock(position: Vector2(0, size.y - 50), size: Vector2(size.x * 2, 50))); // Ground
    add(PlatformBlock(position: Vector2(300, size.y - 200), size: Vector2(200, 20))); // Floating Platform
    add(PlatformBlock(position: Vector2(600, size.y - 350), size: Vector2(200, 20))); // Floating Platform

    // 2. Setup Player
    player = AriaPlayer();
    add(player);

    // 3. Camera Follow
    camera.follow(player);
    // Fix: Use Rectangle.fromRect with Rect.fromLTWH
    camera.setBounds(Rectangle.fromRect(Rect.fromLTWH(0, 0, 2000, size.y))); 
  }

  void onJoyStickChange(JoystickDirection direction, Vector2 delta) {
    player.move(direction, delta);
  }

  void jump() {
    player.jump();
  }

  void attack() {
    player.attack();
  }
  
  void timePulse() {
    // Implement Time Pulse logic (slow down world)
    if (energy >= 30) {
      energy -= 30;
      // Logic to slow down enemies would go here
      debugPrint("Time Pulse Activated!");
    }
  }
}
