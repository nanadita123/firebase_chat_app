import 'package:flutter/material.dart';

class AppSnackbar {
  // ✅ SUCCESS
  static void success(BuildContext context, String message) {
    _show(
      context,
      message,
      backgroundColor: Colors.green,
      icon: Icons.check_circle,
    );
  }

  // ❌ ERROR
  static void error(BuildContext context, String message) {
    _show(
      context,
      message,
      backgroundColor: Colors.red,
      icon: Icons.error,
    );
  }

  // ⚠️ WARNING (optional)
  static void warning(BuildContext context, String message) {
    _show(
      context,
      message,
      backgroundColor: Colors.orange,
      icon: Icons.warning,
    );
  }

  // 🔧 COMMON METHOD
  static void _show(
      BuildContext context,
      String message, {
        required Color backgroundColor,
        required IconData icon,
      }) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      duration: const Duration(seconds: 2),
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}