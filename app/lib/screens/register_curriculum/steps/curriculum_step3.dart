import 'package:dev_cv/components/input.dart';
import 'package:flutter/material.dart';

class CurriculumStep3 extends StatefulWidget {
  const CurriculumStep3({super.key});

  @override
  State<CurriculumStep3> createState() => _CurriculumStep3State();
}

class _CurriculumStep3State extends State<CurriculumStep3> {
  final int _numberOfJobs = 2;

  late final TextEditingController _companyController;
  late final TextEditingController _periodController;
  late final TextEditingController _jobFunctionController;

  @override
  void initState() {
    _companyController = TextEditingController();
    _periodController = TextEditingController();
    _jobFunctionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _companyController.dispose();
    _periodController.dispose();
    _jobFunctionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
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
                        height: 35,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Builder(
                                builder: (BuildContext context) {
                                  return Text(
                                    _numberOfJobs.toString(),
                                    style: const TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      )
                  ],
                ),
                const SizedBox(height: 18),
                Column(
                  children: [
                    Input(
                      title: 'Empresa',
                      placeholder: 'Empresa',
                      controller: _companyController,
                    ),
                    Input(
                      title: 'Período',
                      placeholder: '1999 - 1999',
                      controller: _periodController,
                    ),
                    Input(
                      title: 'Função',
                      placeholder: 'Função',
                      controller: _jobFunctionController,
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
