import 'package:flutter/material.dart';

class InputPassword extends StatefulWidget {
  final String title;
  final String placeholder;
  final TextEditingController controller;

  const InputPassword({
    required this.title,
    required this.placeholder,
    required this.controller,
    super.key,
  });

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool _showPassword = false;

  void _toggleVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF9AA4FF),
              ),
            )
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          controller: widget.controller,
          obscureText: !_showPassword,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            height: 1.25,
            color: Color(0xFF9AA4FF),
          ),
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: Color(0xFF5363F5),
                width: 2,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: Color(0xFF5363F5),
                width: 1.5,
              ),
            ),
            hintStyle: const TextStyle(color: Color(0xF89AA4FF)),
            hintText: widget.placeholder,
            suffixIcon: IconButton(
              onPressed: () => _toggleVisibility(),
              icon: Icon(
                _showPassword ? Icons.visibility : Icons.visibility_off,
                color: const Color(0xFF9AA4FF),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
