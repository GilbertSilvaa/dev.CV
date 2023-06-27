import 'package:dev_cv/components/step_list.dart';
import 'package:dev_cv/screens/home/register_curriculum/curriculum_step1.dart';
import 'package:dev_cv/screens/home/register_curriculum/curriculum_step2.dart';
import 'package:dev_cv/screens/home/register_curriculum/curriculum_step3.dart';
import 'package:dev_cv/screens/home/register_curriculum/curriculum_step4.dart';
import 'package:dev_cv/screens/home/register_curriculum/curriculum_step5.dart';
import 'package:flutter/material.dart';

class RegisterCurriculum extends StatefulWidget {
  const RegisterCurriculum({super.key});

  @override
  State<RegisterCurriculum> createState() => _RegisterCurriculumState();
}

class _RegisterCurriculumState extends State<RegisterCurriculum> {
  final _steps = const [
    CurriculumStep1(),
    CurriculumStep2(),
    CurriculumStep3(),
    CurriculumStep4(),
    CurriculumStep5()
  ];
  int _currentStep = 1;

  void _nextStep() {
    setState(() {
      if (_currentStep < 5) {
        _currentStep++;
      }
    });
  }

  void _previousStep() {
    setState(() {
      if (_currentStep > 1) {
        _currentStep--;
      }
    });
  }

  void _finish() {
// Lógica para concluir o processo de registro
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 50),
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _steps[_currentStep - 1],
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (_currentStep > 1)
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: ElevatedButton.icon(
                                onPressed: _previousStep,
                                icon: const Icon(Icons.arrow_back),
                                label: const Text('Voltar'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF5363F5),
                                  foregroundColor: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        if (_currentStep < 5)
                          Expanded(
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: SizedBox(
                                  height: 50,
                                  child: ElevatedButton.icon(
                                    onPressed: _nextStep,
                                    icon: const Icon(Icons.arrow_back),
                                    label: const Text('Avançar'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF5363F5),
                                      foregroundColor: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (_currentStep == 5)
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: SizedBox(
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: _finish,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff2BAE6F),
                                    foregroundColor: Colors.white,
                                  ),
                                  child: const Text('Concluir'),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StepList(currentStep: _currentStep),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
