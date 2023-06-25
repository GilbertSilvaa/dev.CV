import 'package:dev_cv/components/alert_modal.dart';
import 'package:dev_cv/components/button.dart';
import 'package:dev_cv/components/developer_contact_items.dart';
import 'package:dev_cv/components/developer_infos_list.dart';
import 'package:dev_cv/components/developer_profile_card.dart';
import 'package:dev_cv/components/developer_technologies.dart';
import 'package:dev_cv/components/top_button.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class Curruculum extends StatefulWidget {
  const Curruculum({super.key});

  @override
  State<Curruculum> createState() => _CurruculumState();
}

class _CurruculumState extends State<Curruculum> {
  final bool _hasCurriculum = true;
  final bool _curriculumOwner = true;
  final bool _loadingCurriculum = false;

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: ((context) {
        return AlertModal(
          icon: Icons.cancel_outlined,
          title: 'Excluir CV?',
          text: 'Seu CV será excluído\npermanentemente.',
          buttonText: 'Excluir',
          buttonFunction: () {
            Navigator.of(context).pop();
          },
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _hasCurriculum
        ? Column(
            children: [
              _curriculumOwner
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TopButton(
                          onPressed: () {},
                          icon: FeatherIcons.edit2,
                          labelText: 'Editar CV',
                          backgroundColor: const Color(0xff5363F5),
                        ),
                        TopButton(
                          onPressed: () {
                            _showDialog(context);
                          },
                          icon: Icons.delete,
                          labelText: 'Excluir CV',
                          backgroundColor: const Color(0xffEC3E3E),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TopButton(
                          onPressed: () {},
                          icon: FeatherIcons.arrowLeft,
                          labelText: 'Voltar',
                          backgroundColor: const Color(0xff464965),
                        ),
                      ],
                    ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  children: const [
                    DeveloperProfileCard(
                      imagePath: 'assets/images/avatar_example.png',
                      name: 'Manoel Gomes',
                      position: 'Desenvolvedor Fullstack',
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    DeveloperContactItems(
                      location: 'Maranhão, Brasil',
                      company: 'Youtube',
                      github: 'manoel-gomes',
                      email: 'manoelgomes@canetaazul.com',
                      linkedin: 'manoel-gomes-199',
                      website: 'manoelgomes.com.br',
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    DeveloperTechnologies(
                      hasLink: true,
                      numOfTechs: 9,
                      techs: [
                        'JavaScript',
                        'JavaScript',
                        'JavaScript',
                        'JavaScript',
                        'JavaScript',
                        'JavaScript',
                        'JavaScript',
                        'JavaScript',
                        'JavaScript',
                        'JavaScript',
                      ],
                    ),
                    SizedBox(height: 24),
                    DeveloperInfosList(
                      title: 'Experiências',
                      hasLink: true,
                      numItems: 2,
                      urlLink: 'jobs',
                      developerInfoItems: [
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
                      ],
                    ),
                    SizedBox(height: 24),
                    DeveloperInfosList(
                      title: 'Educação',
                      hasLink: true,
                      numItems: 2,
                      urlLink: 'education',
                      developerInfoItems: [
                        {
                          'title': 'IFSP Boituva',
                          'subtitle': '2020 - Atualmente',
                          'txt': 'Redes de Computadores',
                        },
                        {
                          'title': 'IFSP Boituva',
                          'subtitle': '2020 - Atualmente',
                          'txt': 'Redes de Computadores',
                        },
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        : Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/without_cv.png'),
                  const SizedBox(height: 36),
                  const Text(
                    'Ops, você não possui um currículo',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Não encontramos nenhum currículo\n cadastrado. Você pode criar um\n currículo a qualquer momento!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 28),
                  Button(title: 'Cadastrar Currículo', onPressed: () {}),
                ],
              ),
            ),
          );
  }
}

// class Curriculum extends StatelessWidget {
//   const Curriculum({super.key});

//   final bool _hasCurriculum = true;
//   final bool _curriculumOwner = true;

//   void _showDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: ((context) {
//         return AlertModal(
//           icon: Icons.cancel_outlined,
//           title: 'Excluir CV?',
//           text: 'Seu CV será excluído\npermanentemente.',
//           buttonText: 'Excluir',
//           buttonFunction: () {
//             Navigator.of(context).pop();
//           },
//         );
//       }),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _hasCurriculum
//         ? Column(
//             children: [
//               _curriculumOwner
//                   ? Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         TopButton(
//                           onPressed: () {},
//                           icon: FeatherIcons.edit2,
//                           labelText: 'Editar CV',
//                           backgroundColor: const Color(0xff5363F5),
//                         ),
//                         TopButton(
//                           onPressed: () {
//                             _showDialog(context);
//                           },
//                           icon: Icons.delete,
//                           labelText: 'Excluir CV',
//                           backgroundColor: const Color(0xffEC3E3E),
//                         ),
//                       ],
//                     )
//                   : Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         TopButton(
//                           onPressed: () {},
//                           icon: FeatherIcons.arrowLeft,
//                           labelText: 'Voltar',
//                           backgroundColor: const Color(0xff464965),
//                         ),
//                       ],
//                     ),
//               const SizedBox(height: 20),
//               Expanded(
//                 child: ListView(
//                   padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
//                   children: const [
//                     DeveloperProfileCard(
//                       imagePath: 'assets/images/avatar_example.png',
//                       name: 'Manoel Gomes',
//                       position: 'Desenvolvedor Fullstack',
//                     ),
//                     SizedBox(
//                       height: 24,
//                     ),
//                     DeveloperContactItems(
//                       location: 'Maranhão, Brasil',
//                       company: 'Youtube',
//                       github: 'manoel-gomes',
//                       email: 'manoelgomes@canetaazul.com',
//                       linkedin: 'manoel-gomes-199',
//                       website: 'manoelgomes.com.br',
//                     ),
//                     SizedBox(
//                       height: 24,
//                     ),
//                     DeveloperTechnologies(
//                       hasLink: true,
//                       numOfTechs: 9,
//                       techs: [
//                         'JavaScript',
//                         'JavaScript',
//                         'JavaScript',
//                         'JavaScript',
//                         'JavaScript',
//                         'JavaScript',
//                         'JavaScript',
//                         'JavaScript',
//                         'JavaScript',
//                         'JavaScript',
//                       ],
//                     ),
//                     SizedBox(height: 24),
//                     DeveloperInfosList(
//                       title: 'Experiências',
//                       hasLink: true,
//                       numItems: 2,
//                       urlLink: 'jobs',
//                       developerInfoItems: [
//                         {
//                           'title': 'Lorem Ipsum',
//                           'subtitle': '2020 - Atualmente',
//                           'txt': 'Desenvolvedor front-end',
//                         },
//                         {
//                           'title': 'Lorem Ipsum',
//                           'subtitle': '2020 - Atualmente',
//                           'txt': 'Desenvolvedor front-endd',
//                         },
//                       ],
//                     ),
//                     SizedBox(height: 24),
//                     DeveloperInfosList(
//                       title: 'Educação',
//                       hasLink: true,
//                       numItems: 2,
//                       urlLink: 'education',
//                       developerInfoItems: [
//                         {
//                           'title': 'IFSP Boituva',
//                           'subtitle': '2020 - Atualmente',
//                           'txt': 'Redes de Computadores',
//                         },
//                         {
//                           'title': 'IFSP Boituva',
//                           'subtitle': '2020 - Atualmente',
//                           'txt': 'Redes de Computadores',
//                         },
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           )
//         : Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Image.asset('assets/images/without_cv.png'),
//                   const SizedBox(height: 36),
//                   const Text(
//                     'Ops, você não possui um currículo',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 20,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   const Text(
//                     'Não encontramos nenhum currículo\n cadastrado. Você pode criar um\n currículo a qualquer momento!',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontWeight: FontWeight.w300,
//                       fontSize: 16,
//                     ),
//                   ),
//                   const SizedBox(height: 28),
//                   Button(title: 'Cadastrar Currículo', onPressed: () {}),
//                 ],
//               ),
//             ),
//           );
//   }
// }
