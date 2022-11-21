import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/modules/login/controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller;
  const LoginPage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BlocListener<LoginController, LoginState>(
      bloc: controller,
      listenWhen: ((previous, current) => previous.status != current.status),
      listener: (context, state) {
        // TODO: implement listener
        if (state.status == LoginStatus.failure) {
          final message = state.errorMessage ?? 'Erro ao realizar login';
          AsukaSnackbar.alert(message).show();
        }
      },
      child: Scaffold(
          body: Container(
        decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF0092B9), Color(0xFF0167B2)])),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/jobtimer.png'),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: screenSize.width * .8,
                height: 50,
                // height: screenSize.height * .1,
                child: ElevatedButton(
                  onPressed: () {
                    controller.signIn();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                  ),
                  child: Image.asset(
                    'assets/images/googlelogo.png',
                    height: 30,
                  ),
                ),
              ),
            ),
            BlocSelector<LoginController, LoginState, bool>(
              bloc: controller,
              selector: (state) {
                return state.status == LoginStatus.loading;
              },
              builder: (context, show) {
                return Visibility(
                  visible: show,
                  child: const Center(
                    child: CircularProgressIndicator.adaptive(
                      backgroundColor: Colors.white10,
                    ),
                  ),
                );
              },
            )
          ],
        )),
      )),
    );
  }
}
