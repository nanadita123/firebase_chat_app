import 'package:firebase_chat_app/presentation/export/auth_exports.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRemoteDataSource authDataSource;

  AuthBloc(this.authDataSource) : super(AuthInitial()) {
    on<LoginEvent>(_onLogin);
    on<RegisterEvent>(_onRegister);
    on<GoogleSignInEvent>(_onGoogleSignIn);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading("login"));
    try {
      final user = await authDataSource.login(
        email: event.email,
        password: event.password,
      );
      if (user != null) {
        await authDataSource.saveUser(user);
      }
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading("register"));
    try {
      final user = await authDataSource.register(
        email: event.email,
        password: event.password,
      );
      if (user != null) {
        await authDataSource.saveUser(user);
      }
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onGoogleSignIn(
    GoogleSignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading("google"));
    try {
      final user = await authDataSource.signInWithGoogle();
      if (user != null) {
        await authDataSource.saveUser(user);
      }
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure("Google Sign-In Failed"));
    }
  }
}
