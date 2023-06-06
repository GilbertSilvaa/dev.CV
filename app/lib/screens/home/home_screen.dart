import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? _name;

  @override
  void initState() {
    Future(() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() => _name = prefs.getString('user-name'));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, bool>?;

    return Scaffold(
      body: Center(
        child: Text(
          args?['isFirstTime'] != null
              ? 'Boas-vindas, ${_name ?? ''}, first time'
              : 'Boas-vindas, ${_name ?? ''}',
        ),
      ),
    );
  }
}
