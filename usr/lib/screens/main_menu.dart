import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/constants.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GameColors.backgroundDark,
      body: Stack(
        children: [
          // Background Elements (Abstract shapes)
          Positioned(
            top: -100, right: -100,
            child: Container(
              width: 300, height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: GameColors.primaryPurple.withOpacity(0.2),
                blurRadius: 50,
              ),
            ).animate().scale(duration: 2.seconds, curve: Curves.easeInOut).then().scale(begin: const Offset(1, 1), end: const Offset(0.9, 0.9)),
          ),
          
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title
                const Text(
                  "أصداء الأبدية",
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: GameColors.modernNeon,
                    shadows: [
                      Shadow(blurRadius: 20, color: GameColors.primaryPurple, offset: Offset(0, 0))
                    ]
                  ),
                ).animate().fadeIn().moveY(begin: -20, end: 0),
                
                const Text(
                  "Echoes of Eternity",
                  style: TextStyle(
                    fontSize: 24,
                    letterSpacing: 2,
                    color: GameColors.textWhite,
                  ),
                ).animate().fadeIn(delay: 300.ms),

                const SizedBox(height: 60),

                // Buttons
                _buildMenuButton(context, "Start Game", () {
                  Navigator.pushNamed(context, '/game');
                }),
                const SizedBox(height: 20),
                _buildMenuButton(context, "Options", () {}),
                const SizedBox(height: 20),
                _buildMenuButton(context, "Exit", () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String text, VoidCallback onPressed) {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: GameColors.backgroundMid,
          foregroundColor: GameColors.textWhite,
          side: const BorderSide(color: GameColors.primaryPurple),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text(text, style: const TextStyle(fontSize: 18)),
      ),
    ).animate().fadeIn(delay: 500.ms).slideX();
  }
}
