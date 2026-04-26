import 'dart:ui';

import 'package:firebase_chat_app/presentation/export/auth_exports.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),

            AppText(AppStrings.login, style: AppTextStyles.heading),

            AppSpacing.v16,

            CustomTextField(
              controller: emailController,
              hintText: AppStrings.email,
            ),

            AppSpacing.v16,

            CustomTextField(
              controller: passwordController,
              hintText: AppStrings.password,
              isPassword: true,
            ),

            AppSpacing.v24,

            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  AppSnackbar.success(context, "Welcome 🎉");
                  AppNavigator.pushReplacementNamed(context, AppRoutes.home);
                } else if (state is AuthFailure) {
                  AppSnackbar.error(context, state.message);
                }
              },
              builder: (context, state) {
                final isLoginLoading = state is AuthLoading && state.type == "login";
                final isGoogleLoading = state is AuthLoading && state.type == "google";
                return Column(
                  children: [
                    AppButton(
                      text: AppStrings.signIn,
                      isLoading: isLoginLoading,
                      onPressed: () {
                        context.read<AuthBloc>().add(
                          LoginEvent(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          ),
                        );
                      },
                    ),
                    AppSpacing.v16,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          AppStrings.dontHaveAccount,
                          style: AppTextStyles.small.copyWith(fontSize: 14),
                        ),
                        AppSpacing.h4,

                        InkWell(
                          onTap: () {
                            AppNavigator.pushNamed(context, AppRoutes.register);
                          },
                          child: AppText(
                            AppStrings.signUp,
                            style: AppTextStyles.title.copyWith(
                              fontSize: 15,
                              color: AppColors.darkPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),

                    AppSpacing.v16,
                    GoogleButton(
                      isLoading: false,
                      onPressed: () {
                        context.read<AuthBloc>().add(GoogleSignInEvent());
                      },
                    ),
                    if (isGoogleLoading)
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          color: AppColors.darkBackground.withValues(alpha: 0.3),
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}
