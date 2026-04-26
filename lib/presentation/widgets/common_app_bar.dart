
import 'package:flutter/material.dart';
import '../../core/theme/app_text_styles.dart';
import '../widgets/app_text.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBack;
  final List<Widget>? actions;
  final VoidCallback? onBack;

  const CommonAppBar({
    super.key,
    required this.title,
    this.showBack = false,
    this.actions,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,

      leading: showBack
          ? IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: onBack ?? () => Navigator.pop(context),
      )
          : null,

      title: AppText(
        title,
        style: AppTextStyles.title,

      ),

      actions: actions,

      backgroundColor: theme.appBarTheme.backgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}