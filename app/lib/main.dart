import 'package:dev_cv/screens/home/welcome_screen.dart';
import 'package:dev_cv/screens/index.dart';
import 'package:flutter/material.dart';
import 'package:dev_cv/screens/home/home_screen.dart';
import 'package:dev_cv/screens/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dev.CV',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF22212C),
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        useMaterial3: true,
        dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(8.0), // Define o borderRadius desejado
          ),
        ),
      ),
      initialRoute: '/home',
      routes: {
        '/index': (context) => const Index(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const Home(),
        '/welcome': (context) => const WelcomeScreen(name: 'Rafael')
      },
    );
  }
}
