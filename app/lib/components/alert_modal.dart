import 'package:flutter/material.dart';

class AlertModal extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;
  final String buttonText;
  final Function buttonFunction;

  const AlertModal({
    required this.icon,
    required this.title,
    required this.text,
    required this.buttonText,
    required this.buttonFunction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xff2C2A42),
      elevation: 0,
      content: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 60.0,
              color: const Color(0xffEC3E3E),
            ),
            const SizedBox(height: 16.0),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              text,
              style: const TextStyle(
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
                  buttonFunction();
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xffEC3E3E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: Text(
                  buttonText,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
