import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../components/input.dart';

class CurriculumStep1 extends StatefulWidget {
  const CurriculumStep1({super.key});

  @override
  State<CurriculumStep1> createState() => _CurriculumStep1State();
}

class _CurriculumStep1State extends State<CurriculumStep1> {
  late final TextEditingController _nameController;
  late final TextEditingController _jobController;
  late final TextEditingController _locationController;
  late final TextEditingController _companyController;
  late final TextEditingController _githubController;
  late final TextEditingController _emailController;
  late final TextEditingController _linkedinController;
  late final TextEditingController _siteController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _jobController = TextEditingController();
    _locationController = TextEditingController();
    _companyController = TextEditingController();
    _githubController = TextEditingController();
    _emailController = TextEditingController();
    _linkedinController = TextEditingController();
    _siteController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _jobController.dispose();
    _locationController.dispose();
    _companyController.dispose();
    _githubController.dispose();
    _emailController.dispose();
    _linkedinController.dispose();
    _siteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                const Row(
                  children: [
                    Text(
                      'Informações Básicas',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Input(
                  title: 'Nome',
                  placeholder: 'Nome',
                  controller: _nameController,
                ),
                Input(
                  title: 'Cargo',
                  placeholder: 'Cargo',
                  controller: _jobController,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
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
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                const Row(
                  children: [
                    Text(
                      'Dados de Contato',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Input(
                  title: 'Localização',
                  placeholder: 'Localização',
                  controller: _locationController,
                ),
                Input(
                  title: 'Empresa',
                  placeholder: 'Empresa (opcional)',
                  controller: _companyController,
                ),
                Input(
                  title: 'Github',
                  placeholder: 'Github (opcional)',
                  controller: _githubController,
                ),
                Input(
                  title: 'E-mail',
                  placeholder: 'E-mail (opcional)',
                  controller: _emailController,
                ),
                Input(
                  title: 'Linkedin',
                  placeholder: 'Linkedin (opcional)',
                  controller: _linkedinController,
                ),
                Input(
                  title: 'Site',
                  placeholder: 'Site (opcional)',
                  controller: _siteController,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
