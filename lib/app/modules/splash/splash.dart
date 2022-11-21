import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/core/job_t_imer_icons.dart';
import 'package:job_timer/app/services/auth/auth_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Modular.get<AuthService>().signOut();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        Modular.to.navigate('/login');
      } else {
        Modular.to.navigate('/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF0092B9), Color(0xFF0167B2)])),
      child: Center(child: Image.asset('assets/images/jobtimer.png')),
    ));
  }
}
