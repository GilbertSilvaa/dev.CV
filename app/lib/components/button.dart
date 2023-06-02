import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String title;

  const Button({required this.title, super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF5363F5),
        minimumSize: const Size.fromHeight(50),
      ),
      child: Text(
        widget.title,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
