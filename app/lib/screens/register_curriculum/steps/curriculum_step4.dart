import 'package:dev_cv/components/input.dart';
import 'package:flutter/material.dart';

class CurriculumStep4 extends StatefulWidget {
  const CurriculumStep4({super.key});

  @override
  State<CurriculumStep4> createState() => _CurriculumStep4State();
}

class _CurriculumStep4State extends State<CurriculumStep4> {
  final int _numberOfJobs = 1;

  late final TextEditingController _institutionController;
  late final TextEditingController _studyPeriodController;
  late final TextEditingController _courseController;

  @override
  void initState() {
    _institutionController = TextEditingController();
    _studyPeriodController = TextEditingController();
    _courseController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _institutionController.dispose();
    _studyPeriodController.dispose();
    _courseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height *
          0.7, // Definindo a altura como 70% da tela
      child: Center(
        child: Container(
          height: 480,
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsetsDirectional.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: const Color(0xFF2C2A42),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 9),
                spreadRadius: -4,
                blurRadius: 13,
                color: Color.fromRGBO(0, 15, 5, 0.15),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Experiências Profissionais',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    if (_numberOfJobs > 0)
                      SizedBox(
                        height: 25,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(2.0),
                            backgroundColor:
                                Colors.blue, // Cor de fundo do botão
                            foregroundColor: Colors.white,
                            // Cor do texto do botão
                          ),
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Builder(
                              builder: (BuildContext context) {
                                return Text(
                                  _numberOfJobs.toString(),
                                  style: const TextStyle(fontSize: 16),
                                );
                              },
                            ),
                          ),
                        ),
                      )
                  ],
                ),
                const SizedBox(height: 25),
                Column(
                  children: [
                    Input(
                      title: 'Institução',
                      placeholder: 'Institução',
                      controller: _institutionController,
                    ),
                    Input(
                      title: 'Período',
                      placeholder: 'Período',
                      controller: _studyPeriodController,
                    ),
                    Input(
                      title: 'Curso',
                      placeholder: 'Curso',
                      controller: _courseController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff2BAE6F),
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Adicionar'),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
