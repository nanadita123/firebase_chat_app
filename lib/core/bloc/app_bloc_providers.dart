import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/datasources/auth_remote_datasource.dart';
import '../../injection/injection.dart';
import '../../presentation/blocs/auth/auth_bloc.dart';
import '../../presentation/blocs/splash/splash_bloc.dart';

class AppBlocProviders extends StatelessWidget {
  final Widget child;

  const AppBlocProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<SplashBloc>()),

        BlocProvider(create: (_) => AuthBloc(AuthRemoteDataSource())),

        // 🔹 Chat Bloc (add later)
        // BlocProvider(
        //   create: (_) => ChatBloc(),
        // ),
      ],
      child: child,
    );
  }
}
