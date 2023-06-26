import 'package:dev_cv/components/button.dart';
import 'package:dev_cv/screens/home/register_curriculum/curriculum_step1.dart';
import 'package:dev_cv/screens/home/register_curriculum/curriculum_step2.dart';
import 'package:dev_cv/screens/home/register_curriculum/curriculum_step3.dart';
import 'package:dev_cv/screens/home/register_curriculum/curriculum_step4.dart';
import 'package:dev_cv/screens/home/register_curriculum/curriculum_step5.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class RegisterCurriculum extends StatefulWidget {
  const RegisterCurriculum({super.key});

  @override
  State<RegisterCurriculum> createState() => _RegisterCurriculumState();
}

class _RegisterCurriculumState extends State<RegisterCurriculum> {
  final _curriculumSteps = const [
    CurriculumStep1(),
    CurriculumStep2(),
    CurriculumStep3(),
    CurriculumStep4(),
    CurriculumStep5()
  ];
  int _currentStepIndex = 0;

  void _nextStep() {
    if (_currentStepIndex == _curriculumSteps.length - 1) {
      return;
    }
    setState(() {
      _currentStepIndex++;
    });
  }

  void _previousStep() {
    if (_currentStepIndex == 0) {
      return;
    }
    setState(() {
      _currentStepIndex--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('a')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    'Currículo',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              _curriculumSteps[_currentStepIndex],
              const SizedBox(height: 15),
              _currentStepIndex == 0
                  ? ChangeStepButton(onPressed: _nextStep, isNext: true)
                  : _currentStepIndex != _curriculumSteps.length - 1
                      ? Row(
                          children: [
                            ChangeStepButton(
                                onPressed: _previousStep, isNext: false),
                            ChangeStepButton(onPressed: _nextStep, isNext: true)
                          ],
                        )
                      : Row(
                          children: [
                            ChangeStepButton(
                                onPressed: _previousStep, isNext: false),
                            // ChangeStepButton(onPressed: () {}, isNext: true)
                          ],
                        )
              // CustomPaint(
              //   size: const Size(20, 20),
              //   painter: CirclePainter(),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class ChangeStepButton extends StatefulWidget {
  final bool isNext;
  final Function onPressed;

  const ChangeStepButton({
    required this.onPressed,
    required this.isNext,
    super.key,
  });

  @override
  State<ChangeStepButton> createState() => _ChangeStepButtonState();
}

class _ChangeStepButtonState extends State<ChangeStepButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.onPressed();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF5363F5),
        minimumSize: const Size.fromHeight(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.isNext
            ? const [
                Text(
                  'Avançar',
                  style: TextStyle(fontSize: 18),
                ),
                Icon(FeatherIcons.arrowRight)
              ]
            : const [
                Icon(FeatherIcons.arrowLeft),
                Text(
                  'Voltar',
                  style: TextStyle(fontSize: 18),
                ),
              ],
      ),
    );
  }
}

// class CirclePainter extends CustomPainter {
//   final _paint = Paint()
//     ..color = Colors.red
//     ..strokeWidth = 2
//     // Use [PaintingStyle.fill] if you want the circle to be filled.
//     ..style = PaintingStyle.fill;

//   @override
//   void paint(Canvas canvas, Size size) {
//     canvas.drawOval(
//       Rect.fromLTWH(0, 0, size.width, size.height),
//       _paint,
//     );
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }
