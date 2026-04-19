import 'package:firebase_chat_app/presentation/export/auth_exports.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final nameController = TextEditingController();
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

            AppText(AppStrings.register, style: AppTextStyles.heading),

            AppSpacing.v16,

            CustomTextField(
              controller: nameController,
              hintText: AppStrings.username,

            ),

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

                  Navigator.pushReplacementNamed(context, AppRoutes.home);
                } else if (state is AuthFailure) {
                  AppSnackbar.error(context, state.message);
                }
              },
              builder: (context, state) {
                return AppButton(
                  text: AppStrings.signUp,
                  isLoading: state is AuthLoading,
                  onPressed: () {
                    context.read<AuthBloc>().add(
                      RegisterEvent(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      ),
                    );
                  },
                );
              },
            ),

            AppSpacing.v16,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  AppStrings.alreadyHaveAccount,
                  style: AppTextStyles.small.copyWith(fontSize: 14),
                ),
                AppSpacing.h4,

                InkWell(
                  onTap: () {
                    Navigator.pop(context);
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

            const Spacer(),
          ],
        ),
      ),
    );
  }
}
