import 'package:dev_cv/components/input_password.dart';
import 'package:flutter/material.dart';
import '../../components/input.dart';
import '../../components/button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void handleChange(String value) {
    debugPrint(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width * 0.9,
            margin: const EdgeInsetsDirectional.only(top: 50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              color: const Color(0xFF2C2A42),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Input(
                    title: 'Nome',
                    placeholder: 'Nome do usuário',
                    icon: Icons.person_2_outlined,
                  ),
                  Input(
                    title: 'E-mail',
                    placeholder: 'usuario@email.com.br',
                    icon: Icons.email_outlined,
                  ),
                  InputPassword(
                    title: 'Senha',
                    placeholder: 'Senha do usuário',
                  ),
                  InputPassword(
                    title: 'Confirme a Senha',
                    placeholder: 'Confirmação da senha',
                  ),
                  SizedBox(height: 32),
                  Button(title: 'Cadastre-se')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
