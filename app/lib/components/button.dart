import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String title;
  final bool? isLoading;
  final Function onPressed;

  const Button({
    required this.title,
    required this.onPressed,
    this.isLoading,
    super.key,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (widget.isLoading == null) {
          widget.onPressed();
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF5363F5),
        minimumSize: const Size.fromHeight(50),
      ),
      child: widget.isLoading != null
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            )
          : Text(
              widget.title,
              style: const TextStyle(fontSize: 18),
            ),
    );
  }
}
