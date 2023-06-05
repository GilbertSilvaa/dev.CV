import 'dart:async';
import 'package:dev_cv/services/api_service.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  void initState() {
    Future(() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAccess = prefs.getString('access-token');

      var response = await ApiService.post(
        url: '/curriculum/user',
        headers: {
          'Content-Type': 'application/json',
          'x-access-token': tokenAccess ?? ''
        },
      );

      if (response != null && (response['auth'] as bool) == false) {
        debugPrint('não esta autenticado');
        if (context.mounted) {
          Navigator.of(context).pushReplacementNamed('/login');
        }
        return;
      }
      if (context.mounted) Navigator.of(context).pushReplacementNamed('/home');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'),
          ],
        ),
      ),
    );
  }
}
