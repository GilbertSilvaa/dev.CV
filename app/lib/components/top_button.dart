import 'package:flutter/material.dart';

class TopButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String labelText;
  final Color backgroundColor;

  const TopButton(
      {required this.onPressed,
      required this.icon,
      required this.labelText,
      required this.backgroundColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 18,
            ),
            const SizedBox(width: 8.0),
            Text(
              labelText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
