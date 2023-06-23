import 'package:dev_cv/screens/home/curriculum_screen.dart';
import 'package:dev_cv/screens/home/home_list_screen.dart';
import 'package:dev_cv/screens/home/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late SharedPreferences prefs;
  final _captions = const [HomeList(), Curriculum()];
  String? _name;
  int _pageSelected = 0;
  bool _logout = false;

  @override
  void initState() {
    super.initState();
    Future(() async {
      prefs = await SharedPreferences.getInstance();
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
        return AlertDialog(
          backgroundColor: const Color(0xff2C2A42),
          elevation: 0,
          content: const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.logout,
                  size: 60.0,
                  color: Color(0xffEC3E3E),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Sair da Conta',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Deseja mesmo sair?',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xff464965),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text('Cancelar',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(width: 16), // Optional spacing between buttons
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      _logout = true;
                      prefs.setString('access-token', '');
                      Navigator.of(context).pushReplacementNamed('/login');
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xffEC3E3E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text('Sair',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ), //
          ],
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, bool>?;

    return args?['isFirstTime'] != null
        ? WelcomeScreen(name: _name!)
        : Scaffold(
            body: Container(
                margin: const EdgeInsetsDirectional.only(top: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: _captions[_pageSelected],
                    ),
                  ],
                )),
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
