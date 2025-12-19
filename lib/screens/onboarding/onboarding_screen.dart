import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // Simulate opening an overlay on button click.
  void _onPepiconsPressed() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Frame 42'),
        content: const Text('This is the overlay content.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          // Logo at top-left: width 371, height 104, top 65px, left 47px
          Positioned(
            top: 65,
            left: 47,
            child: Opacity(
              opacity: 1.0,
              child: Image.asset(
                'lib/assets/images/spent1.png',
                width: 371,
                height: 104,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Pepicons button at top-right: width 118, height 118, top 169px
          Positioned(
            top: 169,
            right: 20,
            child: GestureDetector(
              onTap: _onPepiconsPressed,
              child: Container(
                width: 118,
                height: 118,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // ignore: deprecated_member_use
                  color: Colors.white.withOpacity(0.9),
                ),
                child: const Icon(
                  Icons.info_outline,
                  size: 60,
                  color: Colors.blue,
                ),
              ),
            ),
          ),

          // Header text centered at bottom: width 1000, height 116, top 1064px
          // Font: Inter, weight 400, size 48px, line-height 100%, text-align center
          Positioned(
            top: 1064,
            left: (screenWidth - 1000) / 2,
            child: SizedBox(
              width: 1000,
              height: 116,
              child: Center(
                child: Text(
                  'Advancing Blockchain Research, Innovation & Policy in Africa',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 48,
                    height: 1.0,
                    letterSpacing: 0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          // Skip button (top-right corner)
          Positioned(
            top: 16,
            right: 16,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                );
              },
              child: const Text(
                'Skip',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),

          // Get Started button (bottom-right)
          Positioned(
            bottom: 32,
            right: 32,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// HomeScreen: Simple home screen shown after onboarding.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'SPENT DIGITAL LABS',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Spent Digital Labs',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Advancing Blockchain Research, Innovation & Policy in Africa',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
