import 'package:flutter/material.dart';
import '../widgets/myTextField.dart';

class Login extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              const Icon(
                Icons.message,
                size: 80,
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Welcome back you\'ve been missed',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 25,
              ),
              MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true),
            ],
          ),
        ),
      )),
    );
  }
}
