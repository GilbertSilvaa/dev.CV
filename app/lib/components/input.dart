import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final String title;
  final String placeholder;
  final IconData? icon;
  final TextInputType? typeKeyboard;
  final TextEditingController controller;
  final String? errorText;

  const Input({
    required this.title,
    required this.placeholder,
    required this.controller,
    this.typeKeyboard,
    this.icon,
    this.errorText,
    super.key,
  });

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
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
          keyboardType: widget.typeKeyboard,
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
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: Color(0xFFF65757),
                width: 1.5,
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: Color(0xFFF65757),
                width: 2,
              ),
            ),
            errorStyle: const TextStyle(color: Color(0xFFF65757)),
            errorText: widget.errorText,
            hintStyle: const TextStyle(color: Color(0xF89AA4FF)),
            hintText: widget.placeholder,
            suffixIcon: Icon(
              widget.icon,
              color: const Color(0xFF9AA4FF),
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
