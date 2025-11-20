import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import '../game/echoes_game.dart';
import '../utils/constants.dart';

class GamePlayScreen extends StatefulWidget {
  const GamePlayScreen({super.key});

  @override
  State<GamePlayScreen> createState() => _GamePlayScreenState();
}

class _GamePlayScreenState extends State<GamePlayScreen> {
  late EchoesGame _game;

  @override
  void initState() {
    super.initState();
    _game = EchoesGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. The Game Layer
          GameWidget(game: _game),

          // 2. HUD Layer (Heads Up Display)
          SafeArea(
            child: Column(
              children: [
                // Top Bar (Health & Energy)
                _buildTopBar(),
                
                const Spacer(),
                
                // Bottom Controls
                _buildControls(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // Avatar Placeholder
          Container(
            width: 50, height: 50,
            decoration: BoxDecoration(
              color: GameColors.primaryPurple,
              shape: BoxShape.circle,
              border: Border.all(color: GameColors.textWhite, width: 2),
            ),
            child: const Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 10),
          // Bars
          Expanded(
            child: Column(
              children: [
                // Health Bar
                LinearProgressIndicator(
                  value: 1.0,
                  backgroundColor: Colors.grey[800],
                  color: GameColors.health,
                  minHeight: 10,
                  borderRadius: BorderRadius.circular(5),
                ),
                const SizedBox(height: 5),
                // Energy Bar
                LinearProgressIndicator(
                  value: 0.8,
                  backgroundColor: Colors.grey[800],
                  color: GameColors.energy,
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(5),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          // Memory Fragments
          Row(
            children: const [
              Icon(Icons.diamond, color: GameColors.memory),
              SizedBox(width: 5),
              Text("45", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildControls() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left: Joystick Area (Visual representation, actual logic can be overlay or gesture detector)
          // For this prototype, we use a simple D-Pad or rely on Flame's joystick if added as component.
          // Here we add a visual Joystick placeholder for the UI layer.
          Container(
            width: 120, height: 120,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withOpacity(0.3)),
            ),
            child: Center(
              child: Icon(Icons.gamepad, color: Colors.white.withOpacity(0.5), size: 40),
            ),
          ),

          // Right: Action Buttons
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Time Pulse
              _buildActionButton(Icons.flash_on, GameColors.energy, () => _game.timePulse()),
              const SizedBox(width: 10),
              // Attack
              _buildActionButton(Icons.waves, GameColors.enemy, () => _game.attack(), size: 70),
              const SizedBox(width: 10),
              // Jump
              _buildActionButton(Icons.arrow_upward, GameColors.modernNeon, () => _game.jump()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, Color color, VoidCallback onTap, {double size = 60}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color.withOpacity(0.8),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(color: color.withOpacity(0.4), blurRadius: 10, spreadRadius: 2)
          ],
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Icon(icon, color: Colors.white, size: size * 0.5),
      ),
    );
  }
}
