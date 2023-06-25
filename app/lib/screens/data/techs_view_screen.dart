import 'package:dev_cv/components/developer_technologies.dart';
import 'package:dev_cv/components/top_button.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class Techs extends StatelessWidget {
  const Techs({super.key});

  static List<String> techs = [
    'PHP',
    'JavaScript',
    'PHP',
    'SOFKSFAOK',
    'Aaaaa',
    'Java'
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
                    DeveloperTechnologies(
                      hasLink: false,
                      numOfTechs: techs.length,
                      techs: techs,
                    ),
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
