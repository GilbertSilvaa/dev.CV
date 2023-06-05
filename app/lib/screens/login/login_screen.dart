import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/input.dart';
import '../../components/button.dart';
import '../../components/input_password.dart';
import 'package:dev_cv/screens/register/register_screen.dart';

import '../../models/user_model.dart';
import '../../services/api_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  String? _emailError;
  String? _passwordError;
  bool? _isLoadingForm;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool validateForm() {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email.isEmpty) {
      setState(() => _emailError = 'campo obrigatório');
      return false;
    } else if (password.isEmpty) {
      setState(() => _passwordError = 'campo obrigatório');
      return false;
    }

    return true;
  }

  void onSubmit() async {
    setState(() {
      _emailError = null;
      _passwordError = null;
    });

    if (!validateForm()) return;

    ApiService api = ApiService();

    try {
      setState(() => _isLoadingForm = true);

      var response = await api.post(
        url: '/login',
        headers: {'Content-Type': 'application/json'},
        body: {
          'email': _emailController.text,
          'password': _passwordController.text
        },
      );

      if (response['_id'] != null) {
        final user = UserModel.fromJson(response);
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('access-token', user.token);
        return;
      }

      if (response['message'] != null) {
        setState(() => _passwordError = response['message']);
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsetsDirectional.only(top: 40, bottom: 40),
                width: MediaQuery.of(context).size.width * 0.9,
                margin: const EdgeInsetsDirectional.only(top: 80),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: const Color(0xFF2C2A42),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/logo.png'),
                      const SizedBox(height: 32),
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
                      const SizedBox(height: 32),
                      Button(
                        title: 'Login',
                        onPressed: onSubmit,
                        isLoading: _isLoadingForm,
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Não possui uma conta?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: const Text('Cadastre-se aqui'),
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
