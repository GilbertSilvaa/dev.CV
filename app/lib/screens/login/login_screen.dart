import 'package:dev_cv/components/input_password.dart';
import 'package:dev_cv/services/api_service.dart';
import 'package:flutter/material.dart';
import '../../components/input.dart';
import '../../components/button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _passwordConfirmController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordConfirmController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  void onSubmit() async {
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String passwordConfirm = _passwordConfirmController.text;

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        passwordConfirm.isEmpty) return;

    if (_passwordController.text != _passwordConfirmController.text) return;

    var userResponse = await ApiService.createUser(
      name: name,
      email: email,
      password: password,
    );

    debugPrint(userResponse.token);
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
                children: [
                  Input(
                    title: 'Nome',
                    placeholder: 'Nome do usuário',
                    icon: Icons.person_2_outlined,
                    controller: _nameController,
                  ),
                  Input(
                    title: 'E-mail',
                    placeholder: 'usuario@email.com.br',
                    icon: Icons.email_outlined,
                    typeKeyboard: TextInputType.emailAddress,
                    controller: _emailController,
                  ),
                  InputPassword(
                    title: 'Senha',
                    placeholder: 'Senha do usuário',
                    controller: _passwordController,
                  ),
                  InputPassword(
                    title: 'Confirme a Senha',
                    placeholder: 'Confirmação da senha',
                    controller: _passwordConfirmController,
                  ),
                  const SizedBox(height: 32),
                  Button(
                    title: 'Cadastre-se',
                    onPressed: onSubmit,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
