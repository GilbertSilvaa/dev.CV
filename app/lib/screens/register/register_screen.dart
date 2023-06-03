import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/input.dart';
import '../../components/button.dart';
import '../../components/input_password.dart';
import '../../services/user_service.dart';

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
      setState(() => _nameError = 'campo obrigatório');
      return false;
    } else if (email.isEmpty) {
      setState(() => _emailError = 'campo obrigatório');
      return false;
    } else if (password.isEmpty) {
      setState(() => _passwordError = 'campo obrigatório');
      return false;
    } else if (passwordConfirm.isEmpty) {
      setState(() => _passwordConfirmError = 'campo obrigatório');
      return false;
    } else if (password != passwordConfirm) {
      setState(() => _passwordConfirmError = 'senhas divergentes');
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

    var response = await UserService.create(
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (response == null) {
      setState(() => _emailError = 'email invalido');
      return;
    }

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('access-token', response.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
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
                      const SizedBox(height: 32),
                      Button(
                        title: 'Cadastre-se',
                        onPressed: onSubmit,
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Já possui uma conta?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Faça o Login'),
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
