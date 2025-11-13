import 'package:flutter/material.dart';
import 'screens/auth/splash_screen.dart';
import 'screens/hrd/hrd_dashboard.dart';


void main() {
  runApp(const JobSeekerApp());
}

class JobSeekerApp extends StatelessWidget {
  const JobSeekerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HireLink',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        fontFamily: 'Poppins',
      ),
      home: const SplashScreen(), // Mulai dari splash
      routes: {
  '/hrd_dashboard': (_) => const HrdDashboard(),
}
    );
  }
}

