import 'package:dev_cv/screens/home/welcome_screen.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final SharedPreferences prefs;
  String? _name;
  int _pageSelected = 0;

  @override
  void initState() {
    Future(() async {
      prefs = await SharedPreferences.getInstance();
      setState(() => _name = prefs.getString('user-name'));
    });

    super.initState();
  }

  void _onPageTapped(int index) {
    if (index == 2) {
      prefs.setString('access-token', '');
      Navigator.of(context).pushReplacementNamed('/login');
      return;
    }
    setState(() => _pageSelected = index);
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, bool>?;

    return args?['isFirstTime'] != null
        ? WelcomeScreen(name: _name!)
        : Scaffold(
            body: Center(
              child: Text(
                'Boas-vindas, ${_name ?? ''}',
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: const Color(0xFF6C6892),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.assignment),
                  label: 'Meu currículo',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.logout, color: Colors.red),
                  label: 'Sair',
                ),
              ],
              currentIndex: _pageSelected,
              selectedItemColor: Colors.white,
              onTap: _onPageTapped,
            ),
          );
  }
}
