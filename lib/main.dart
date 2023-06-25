import 'package:chat_app/pages/signIn.dart';
import 'package:flutter/material.dart';
import './home.dart';
import './pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: Login(),
      home: SignIn(),
      routes: {
        SignIn.routeNamed: (context) => SignIn(),
        Login.routeNamed: (context) => Login(),
      },
    );
  }
}
