import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RegisterCurriculum extends StatefulWidget {
  const RegisterCurriculum({super.key});

  @override
  State<RegisterCurriculum> createState() => _RegisterCurriculumState();
}

class _RegisterCurriculumState extends State<RegisterCurriculum> {
  int _currentStepIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Currículo'),
      ],
    );
  }
}
