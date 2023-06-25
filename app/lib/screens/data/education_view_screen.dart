import 'package:dev_cv/components/developer_infos_list.dart';
import 'package:dev_cv/components/top_button.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class Education extends StatelessWidget {
  const Education({super.key});

  static List<Map<String, String>> education = [
    {
      'title': 'IFSP Boituva',
      'subtitle': '2020 - Atualmente',
      'txt': 'Redes de Computadores',
    },
    {
      'title': 'IFSP Boituva',
      'subtitle': '2020 - Atualmente',
      'txt': 'Redes de Computadoresd',
    },
    {
      'title': 'IFSP Boituva',
      'subtitle': '2020 - Atualmente',
      'txt': 'Redes de Computadoresd',
    },
    {
      'title': 'IFSP Boituva',
      'subtitle': '2020 - Atualmente',
      'txt': 'Redes de Computadoresd',
    },
    {
      'title': 'IFSP Boituva',
      'subtitle': '2020 - Atualmente',
      'txt': 'Redes de Computadores',
    },
    {
      'title': 'IFSP Boituva',
      'subtitle': '2020 - Atualmente',
      'txt': 'Redes de Computadoresd',
    },
    {
      'title': 'IFSP Boituva',
      'subtitle': '2020 - Atualmente',
      'txt': 'Redes de Computadoresd',
    },
    {
      'title': 'IFSP Boituva',
      'subtitle': '2020 - Atualmente',
      'txt': 'Redes de Computadoresd',
    },
    {
      'title': 'IFSP Boituva',
      'subtitle': '2020 - Atualmente',
      'txt': 'Redes de Computadores',
    },
    {
      'title': 'IFSP Boituva',
      'subtitle': '2020 - Atualmente',
      'txt': 'Redes de Computadoresd',
    },
    {
      'title': 'IFSP Boituva',
      'subtitle': '2020 - Atualmente',
      'txt': 'Redes de Computadoresd',
    },
    {
      'title': 'IFSP Boituva',
      'subtitle': '2020 - Atualmente',
      'txt': 'Redes de Computadoresd',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TopButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: FeatherIcons.arrowLeft,
                          labelText: 'Voltar',
                          backgroundColor: const Color(0xff464965),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: DeveloperInfosList(
                          numItems: education.length,
                          title: 'Educação',
                          hasLink: false,
                          developerInfoItems: education,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
