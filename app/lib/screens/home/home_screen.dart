import 'package:dev_cv/components/alert_modal.dart';
import 'package:dev_cv/screens/home/curriculum_screen.dart';
import 'package:dev_cv/screens/home/home_list_screen.dart';
import 'package:dev_cv/screens/register_curriculum/welcome_screen.dart';
import 'package:dev_cv/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late SharedPreferences prefs;
  String? _name;
  int _pageSelected = 0;
  bool _logout = false;

  @override
  void initState() {
    super.initState();
    Future(() async {
      prefs = await SharedPreferences.getInstance();
      String? tokenAccess = prefs.getString('access-token');
      var response = await ApiService.post(
        url: '/curriculum/user',
        headers: {
          'Content-Type': 'application/json',
          'x-access-token': tokenAccess ?? ''
        },
      );
      if (response != null &&
          response['auth'] != null &&
          !(response['auth'] as bool)) {
        debugPrint('não esta autenticado');
        if (context.mounted) {
          Navigator.of(context).pushReplacementNamed('/login');
        }
      }
      setState(() => _name = prefs.getString('user-name'));
    });
  }

  void _onPageTapped(int index) {
    if (index == 2) {
      _showDialog(context);
      return;
    }
    setState(() => _pageSelected = index);
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: ((context) {
        return AlertModal(
          icon: Icons.logout,
          title: 'Sair da Conta',
          text: 'Deseja mesmo sair?',
          buttonText: 'Sair',
          buttonFunction: () {
            _logout = true;
            prefs.setString('access-token', '');
            Navigator.of(context).pushReplacementNamed('/login');
          },
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, bool>?;
    final captions = [const HomeList(), const Curriculum()];

    return args != null && args['isFirstTime'] == true
        ? WelcomeScreen(name: _name ?? '')
        : Scaffold(
            body: Container(
              margin: const EdgeInsetsDirectional.only(top: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: captions[_pageSelected],
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              color: const Color(0xff2C2A42),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: const Color(0xff2C2A42),
                  unselectedItemColor: const Color(0xFF6C6892),
                  elevation: 0.0,
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
                      icon: Icon(Icons.logout, color: Color(0xffEC3E3E)),
                      label: 'Sair',
                    ),
                  ],
                  currentIndex: _pageSelected,
                  selectedItemColor: Colors.white,
                  onTap: _onPageTapped,
                  iconSize: 30.0,
                ),
              ),
            ),
          );
  }
}
