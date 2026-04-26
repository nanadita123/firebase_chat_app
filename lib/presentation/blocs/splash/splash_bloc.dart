import 'dart:async';

import '../../../data/datasources/auth_remote_datasource.dart';
import '../../export/splash_exports.dart';


class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AuthRemoteDataSource auth;

  SplashBloc(this.auth) : super(SplashInitial()) {
    on<StartSplash>(_onStart);
  }

  Future<void> _onStart(
      StartSplash event, Emitter<SplashState> emit) async {

    await Future.delayed(const Duration(seconds: 2));

    final user = auth.currentUser;

    if (user != null) {
      emit(SplashNavigateToHome());
    } else {
      emit(SplashNavigateToLogin());
    }
  }
}