import 'package:dev_cv/components/button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final String name;

  const WelcomeScreen({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsetsDirectional.only(top: 50),
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: SingleChildScrollView(
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
                    const SizedBox(height: 24),
                    RichText(
                      text: const TextSpan(
                        text: 'Com o ',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: 'Dev.',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          TextSpan(
                            text: 'CV',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF939CF2),
                            ),
                          ),
                          TextSpan(
                            text: ' você pode:',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '·  Cadastrar seu currículo',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          '·  Atualizar suas informações',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          '·  Encontrar currículos',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    const SizedBox(height: 36),
                    Image.asset('assets/images/welcome.png'),
                    const SizedBox(height: 36),
                    Button(title: 'Cadastrar Currículo', onPressed: () {}),
                    const SizedBox(height: 6),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Quero apenas ver os currículos',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
