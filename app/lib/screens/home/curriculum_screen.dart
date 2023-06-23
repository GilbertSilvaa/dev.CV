import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import '../../components/button.dart';

class Curriculum extends StatelessWidget {
  const Curriculum({super.key});

  final bool _hasCurriculum = true;
  final bool _curriculumOwner = true;

  @override
  Widget build(BuildContext context) {
    return _hasCurriculum
        ? Column(
            children: [
              _curriculumOwner
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            FeatherIcons.edit2,
                            color: Colors.white,
                            size: 18,
                          ),
                          label: const Text(
                            "Editar CV",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff5363F5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 18,
                          ),
                          label: const Text(
                            "Excluir CV",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffEC3E3E),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            FeatherIcons.arrowLeft,
                            color: Colors.white,
                            size: 18,
                          ),
                          label: const Text(
                            "Voltar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff464965),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                      ],
                    ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFF2C2A42),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: const Color(0xffB49AFF), width: 2),
                              ),
                              child: const CircleAvatar(
                                radius: 50,
                                backgroundImage: AssetImage(
                                    'assets/images/avatar_example.png'),
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'Manoel Gomes',
                              style: TextStyle(
                                  color: Color(0xffB49AFF),
                                  fontSize: 21,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'Desenvolvedor Fullstack',
                              style: TextStyle(
                                color: Color(0xffB49AFF),
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFF2C2A42),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  FeatherIcons.mapPin,
                                  color: Color(0xffB49AFF),
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Maranhão, Brasil',
                                  style: TextStyle(
                                    color: Color(0xffB49AFF),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: [
                                Icon(
                                  FeatherIcons.briefcase,
                                  color: Color(0xffB49AFF),
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Youtube',
                                  style: TextStyle(
                                    color: Color(0xffB49AFF),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: [
                                Icon(
                                  FeatherIcons.github,
                                  color: Color(0xffB49AFF),
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'manoel-gomes',
                                  style: TextStyle(
                                    color: Color(0xffB49AFF),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: [
                                Icon(
                                  FeatherIcons.mail,
                                  color: Color(0xffB49AFF),
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'manoelgomes@canetaazul.com',
                                  style: TextStyle(
                                    color: Color(0xffB49AFF),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: [
                                Icon(
                                  FeatherIcons.linkedin,
                                  color: Color(0xffB49AFF),
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'manoel-gomes-199',
                                  style: TextStyle(
                                    color: Color(0xffB49AFF),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: [
                                Icon(
                                  FeatherIcons.mapPin,
                                  color: Color(0xffB49AFF),
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'manoelgomes.com.br',
                                  style: TextStyle(
                                    color: Color(0xffB49AFF),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFF2C2A42),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Tecnologias',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 21),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: const Text(
                                    'Ver todas',
                                    style: TextStyle(
                                        fontSize: 17, color: Color(0xffB49AFF)),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      height: 32,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffB49AFF),
                                        borderRadius:
                                            BorderRadius.circular(9999),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'JavaScript'.toUpperCase(),
                                          style: const TextStyle(
                                            color: Color(0xff22212C),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      height: 32,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffB49AFF),
                                        borderRadius:
                                            BorderRadius.circular(9999),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'JavaScript'.toUpperCase(),
                                          style: const TextStyle(
                                            color: Color(0xff22212C),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      height: 32,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffB49AFF),
                                        borderRadius:
                                            BorderRadius.circular(9999),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'JavaScript'.toUpperCase(),
                                          style: const TextStyle(
                                            color: Color(0xff22212C),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      height: 32,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffB49AFF),
                                        borderRadius:
                                            BorderRadius.circular(9999),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'JavaScript'.toUpperCase(),
                                          style: const TextStyle(
                                            color: Color(0xff22212C),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      height: 32,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffB49AFF),
                                        borderRadius:
                                            BorderRadius.circular(9999),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'JavaScript'.toUpperCase(),
                                          style: const TextStyle(
                                            color: Color(0xff22212C),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      height: 32,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffB49AFF),
                                        borderRadius:
                                            BorderRadius.circular(9999),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'JavaScript'.toUpperCase(),
                                          style: const TextStyle(
                                            color: Color(0xff22212C),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      height: 32,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffB49AFF),
                                        borderRadius:
                                            BorderRadius.circular(9999),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'JavaScript'.toUpperCase(),
                                          style: const TextStyle(
                                            color: Color(0xff22212C),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      height: 32,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffB49AFF),
                                        borderRadius:
                                            BorderRadius.circular(9999),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'JavaScript'.toUpperCase(),
                                          style: const TextStyle(
                                            color: Color(0xff22212C),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      height: 32,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffB49AFF),
                                        borderRadius:
                                            BorderRadius.circular(9999),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'JavaScript'.toUpperCase(),
                                          style: const TextStyle(
                                            color: Color(0xff22212C),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFF2C2A42),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Experiências',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 21),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: const Text(
                                    'Ver todas',
                                    style: TextStyle(
                                        fontSize: 17, color: Color(0xffB49AFF)),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Column(children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '•  Lorem Ipsum',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xffB49AFF),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          '   2020 - Atualmente',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xffB49AFF),
                                            fontWeight: FontWeight.w300,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                        Text(
                                          '   Desenvolvedor front-end',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xffB49AFF),
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '•  Lorem Ipsum',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xffB49AFF),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          '   2020 - Atualmente',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xffB49AFF),
                                            fontWeight: FontWeight.w300,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                        Text(
                                          '   Desenvolvedor front-end',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xffB49AFF),
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFF2C2A42),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Educação',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 21),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: const Text(
                                    'Ver todas',
                                    style: TextStyle(
                                        fontSize: 17, color: Color(0xffB49AFF)),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Column(children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '•  IFSP Boituva',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xffB49AFF),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          '   2020 - Atualmente',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xffB49AFF),
                                            fontWeight: FontWeight.w300,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                        Text(
                                          '   Redes de Computadores',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xffB49AFF),
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '•  IFSP Boituva',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xffB49AFF),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          '   2020 - Atualmente',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xffB49AFF),
                                            fontWeight: FontWeight.w300,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                        Text(
                                          '   Redes de Computadores',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xffB49AFF),
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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
