import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/pages/signIn.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_gate/auth_gate.dart';

import './pages/login.dart';
import 'auth_gate/firebase_methods.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FirebaseMethods())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        //home:
        home: AuthGate(),
        routes: {
          SignIn.routeNamed: (context) => SignIn(),
          Login.routeNamed: (context) => Login(),
        },
      ),
    );
  }
}
