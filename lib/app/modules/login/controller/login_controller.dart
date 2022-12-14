import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:job_timer/app/services/auth/auth_service.dart';

part 'login_state.dart';

class LoginController extends Cubit<LoginState> {
  final AuthService _authService;

  LoginController({
    required AuthService authService,
  })  : _authService = authService,
        super(const LoginState.initial());

  Future<void> signIn() async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      await _authService.signIn();
    } catch (e, s) {
      developer.log('Error when signing in', error: e, stackTrace: s);
      emit(state.copyWith(
        status: LoginStatus.failure,
        errorMessage: 'Error when logging in',
      ));
    }
  }

  void signOut() async {
    // emit(state.copyWith(status: LoginStatus.loading));
    await _authService.signOut();
    try {} catch (e) {
      print(e);
    }
  }
}
