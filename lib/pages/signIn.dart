import 'package:flutter/material.dart';
import '../widgets/myTextField.dart';
import '../widgets/cusButto.dart';
import 'package:provider/provider.dart';
import '../auth_gate/firebase_methods.dart';

class SignIn extends StatefulWidget {
  static const routeNamed = '/signIn';

  SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

  void signIn() {
    if (passwordController.text != confirmpasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Password doesn\'t match')));
      return;
    }
    try {
      Provider.of<FirebaseMethods>(context, listen: false)
          .createUserwithEmailandPassword(
              emailController.text.trim(), passwordController.text.trim());
      //Navigator.pushNamed(context, '/login');
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
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
                  height: 50,
                ),
                MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                    controller: confirmpasswordController,
                    hintText: 'Password',
                    obscureText: true),
                const SizedBox(
                  height: 20,
                ),
                CusButton(onTapFn: signIn, text: 'Sign-In'),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already  member?',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, '/login'),
                      child: const Text(
                        'Sign-In',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
