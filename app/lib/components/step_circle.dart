import 'package:flutter/material.dart';

class StepCircle extends StatelessWidget {
  final bool isActive;

  const StepCircle({
    required this.isActive,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF5363F5) : Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFF5363F5),
          width: 2,
        ),
      ),
    );
  }
}
