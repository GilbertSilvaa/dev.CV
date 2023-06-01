import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPassword = false;
  bool _rememberMe = false;
  late final TextEditingController _userController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _userController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  void _toggleVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  void _testFields() {
    debugPrint('Usuario: ${_userController.text}');
    debugPrint('Senha: ${_passwordController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 0.75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 8),
                const SizedBox(height: 16),
                TextField(
                  controller: _userController,
                  obscureText: !_showPassword,
                  decoration: const InputDecoration(
                    label: Text('E-Mail'),
                    hintText: 'usuario@email.com',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.mail),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  obscureText: !_showPassword,
                  decoration: InputDecoration(
                    label: const Text('Senha'),
                    hintText: 'Senha',
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () => _toggleVisibility(),
                      icon: Icon(
                        _showPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('Memorizar dados'),
                    const SizedBox(
                      width: 8,
                    ),
                    Switch(
                      value: _rememberMe,
                      onChanged: (value) => {
                        setState(() {
                          _rememberMe = value;
                        })
                      },
                    )
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(
                      MediaQuery.of(context).size.width * 0.75,
                      35,
                    ),
                  ),
                  onPressed: () {
                    _testFields();
                  },
                  child: const Text('Login'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
