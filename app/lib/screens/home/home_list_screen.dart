import 'package:dev_cv/components/developer_card.dart';
import 'package:flutter/material.dart';

class HomeList extends StatelessWidget {
  const HomeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Lista de Currículos',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const TextField(
          decoration: InputDecoration(
            hintText: 'Buscar por desenvolvedor',
            hintStyle: TextStyle(color: Color(0xffa5a1c8)),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff7591A8)),
            ),
          ),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
          cursorColor: Colors.white,
          cursorWidth: 2.0,
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: const [
              DeveloperCard(
                avatarImagePath: 'assets/images/avatar_example.png',
                developerName: 'Manoel Gomes',
                position: 'Desenvolvedor Fullstack',
                location: 'Maranhão, Brasil',
                tags: ['JavaScript', 'JavaScript', 'JavaScript', 'php'],
              ),
              SizedBox(height: 20),
              DeveloperCard(
                avatarImagePath: 'assets/images/avatar_example.png',
                developerName: 'Manoel Gomes',
                position: 'Desenvolvedor Fullstack',
                location: 'Maranhão, Brasil',
                tags: ['JavaScript', 'JavaScript', 'JavaScript'],
              ),
              SizedBox(height: 20),
              DeveloperCard(
                avatarImagePath: 'assets/images/avatar_example.png',
                developerName: 'Manoel Gomes',
                position: 'Desenvolvedor Fullstack',
                location: 'Maranhão, Brasil',
                tags: ['JavaScript', 'JavaScript', 'JavaScript'],
              ),
              SizedBox(height: 20),
              DeveloperCard(
                avatarImagePath: 'assets/images/avatar_example.png',
                developerName: 'Manoel Gomes',
                position: 'Desenvolvedor Fullstack',
                location: 'Maranhão, Brasil',
                tags: ['JavaScript', 'JavaScript'],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}
