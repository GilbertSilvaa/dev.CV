import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dev_cv/services/api_service.dart';
import 'package:dev_cv/models/user_model.dart';
import 'package:dev_cv/components/button.dart';
import 'package:dev_cv/components/input.dart';
import 'package:dev_cv/components/input_password.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _passwordConfirmController;
  String? _nameError;
  String? _emailError;
  String? _passwordError;
  String? _passwordConfirmError;
  bool? _isLoadingForm;

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

  bool validateForm() {
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String passwordConfirm = _passwordConfirmController.text;

    if (name.isEmpty) {
      setState(() => _nameError = 'Campo obrigatório');
      return false;
    } else if (email.isEmpty) {
      setState(() => _emailError = 'Campo obrigatório');
      return false;
    } else if (password.isEmpty) {
      setState(() => _passwordError = 'Campo obrigatório');
      return false;
    } else if (passwordConfirm.isEmpty) {
      setState(() => _passwordConfirmError = 'Campo obrigatório');
      return false;
    } else if (password != passwordConfirm) {
      setState(() => _passwordConfirmError = 'Senhas divergentes');
      return false;
    }

    return true;
  }

  void onSubmit() async {
    setState(() {
      _nameError = null;
      _emailError = null;
      _passwordError = null;
      _passwordConfirmError = null;
    });

    if (!validateForm()) return;

    try {
      setState(() => _isLoadingForm = true);

      var response = await ApiService.post(
        url: '/user/create',
        headers: {'Content-Type': 'application/json'},
        body: {
          'name': _nameController.text,
          'email': _emailController.text,
          'password': _passwordController.text
        },
      );

      if (response['_id'] != null) {
        final user = UserModel.fromJson(response);
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('access-token', user.token);
        prefs.setString('user-name', user.name);

        if (context.mounted) {
          Navigator.of(context).pushReplacementNamed(
            '/home',
            arguments: {'isFirstTime': true},
          );
        }
        return;
      }

      if (response['message'] != null) {
        setState(() => _emailError = response['message']);
        return;
      }

      setState(() => _emailError = 'email inválido');
    } finally {
      setState(() => _isLoadingForm = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsetsDirectional.only(top: 10, bottom: 10),
                width: MediaQuery.of(context).size.width * 0.9,
                margin: const EdgeInsetsDirectional.only(top: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: const Color(0xFF2C2A42),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 9),
                      spreadRadius: -4,
                      blurRadius: 13,
                      color: Color.fromRGBO(0, 15, 5, 0.15),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/logo.png'),
                      const SizedBox(height: 24),
                      Input(
                        title: 'Nome',
                        placeholder: 'Nome do usuário',
                        icon: Icons.person_2_outlined,
                        controller: _nameController,
                        errorText: _nameError,
                      ),
                      Input(
                        title: 'E-mail',
                        placeholder: 'usuario@email.com.br',
                        icon: Icons.email_outlined,
                        typeKeyboard: TextInputType.emailAddress,
                        controller: _emailController,
                        errorText: _emailError,
                      ),
                      InputPassword(
                        title: 'Senha',
                        placeholder: 'Senha do usuário',
                        controller: _passwordController,
                        errorText: _passwordError,
                      ),
                      InputPassword(
                        title: 'Confirme a Senha',
                        placeholder: 'Confirmação da senha',
                        controller: _passwordConfirmController,
                        errorText: _passwordConfirmError,
                      ),
                      const SizedBox(height: 18),
                      Button(
                        title: 'Cadastre-se',
                        onPressed: onSubmit,
                        isLoading: _isLoadingForm,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Já possui uma conta?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Faça o Login',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
