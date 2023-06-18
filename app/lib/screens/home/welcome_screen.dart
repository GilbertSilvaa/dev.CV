import 'package:dev_cv/components/button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final String name;

  const WelcomeScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Boas-vindas,',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF939CF2),
                ),
              ),
              const SizedBox(height: 36),
              const Text(
                'Com o Dev.CV você pode:',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    '·  Cadastrar seu currículo',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    '·  Atualizar suas informações',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    '·  Encontrar currículos',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Image.asset('assets/images/welcome.png'),
              const SizedBox(height: 16),
              Button(title: 'Cadastrar Currículo', onPressed: () {}),
              const SizedBox(height: 6),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Quero apenas ver os currículos',
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
