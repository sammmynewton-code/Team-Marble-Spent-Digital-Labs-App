import 'package:flutter/material.dart';
import 'screens/onboarding/onboarding_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spent Digital Labs',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

/// SplashScreen: White background with centered logo image (872x244) that fades in.
/// After 2 seconds, navigates to OnboardingScreen.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    // Preload the splash image so it appears immediately when fade starts.
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        await precacheImage(
          const AssetImage('lib/assets/images/spent1.png'),
          context,
        );
      } catch (_) {
        // If precache fails, continue anyway.
      }

      // Start the fade-in animation after precache.
      if (mounted) {
        _controller.forward();
      }
    });

    // Navigate to OnboardingScreen after animation + delay.
    Future.delayed(const Duration(milliseconds: 2600), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const OnboardingScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var safeArea = SafeArea(
      child: Center(
        child: FadeTransition(
          opacity: _animation,
          child: SizedBox(
            width: 218,
            height: 61,
            child: Image.asset(
              'lib/assets/images/spent1.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
    return Scaffold(backgroundColor: Colors.white, body: safeArea);
  }
}
