import 'dart:async';

import '../../export/splash_exports.dart';


class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<StartSplash>(_onStartSplash);
  }

  Future<void> _onStartSplash(
      StartSplash event,
      Emitter<SplashState> emit,
      ) async {
    await Future.delayed(const Duration(seconds: 3));

    final isLoggedIn = false;

    if (isLoggedIn) {
      emit(SplashNavigateToHome());
    } else {
      emit(SplashNavigateToLogin());
    }
  }
}