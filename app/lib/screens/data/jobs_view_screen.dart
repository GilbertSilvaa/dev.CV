import 'package:dev_cv/components/developer_infos_list.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import '../../components/top_button.dart';

class Jobs extends StatelessWidget {
  const Jobs({super.key});

  static List<Map<String, String>> jobs = [
    {
      'title': 'Lorem Ipsum',
      'subtitle': '2020 - Atualmente',
      'txt': 'Desenvolvedor front-end',
    },
    {
      'title': 'Lorem Ipsum',
      'subtitle': '2020 - Atualmente',
      'txt': 'Desenvolvedor front-endd',
    },
    {
      'title': 'Lorem Ipsum',
      'subtitle': '2020 - Atualmente',
      'txt': 'Desenvolvedor front-endd',
    },
    {
      'title': 'Lorem Ipsum',
      'subtitle': '2020 - Atualmente',
      'txt': 'Desenvolvedor front-endd',
    },
    {
      'title': 'Lorem Ipsum',
      'subtitle': '2020 - Atualmente',
      'txt': 'Desenvolvedor front-end',
    },
    {
      'title': 'Lorem Ipsum',
      'subtitle': '2020 - Atualmente',
      'txt': 'Desenvolvedor front-endd',
    },
    {
      'title': 'Lorem Ipsum',
      'subtitle': '2020 - Atualmente',
      'txt': 'Desenvolvedor front-endd',
    },
    {
      'title': 'Lorem Ipsum',
      'subtitle': '2020 - Atualmente',
      'txt': 'Desenvolvedor front-endd',
    },
    {
      'title': 'Lorem Ipsum',
      'subtitle': '2020 - Atualmente',
      'txt': 'Desenvolvedor front-end',
    },
    {
      'title': 'Lorem Ipsum',
      'subtitle': '2020 - Atualmente',
      'txt': 'Desenvolvedor front-endd',
    },
    {
      'title': 'Lorem Ipsum',
      'subtitle': '2020 - Atualmente',
      'txt': 'Desenvolvedor front-endd',
    },
    {
      'title': 'Lorem Ipsum',
      'subtitle': '2020 - Atualmente',
      'txt': 'Desenvolvedor front-endd',
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
                          numItems: jobs.length,
                          title: 'Experiências',
                          hasLink: false,
                          developerInfoItems: jobs,
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
