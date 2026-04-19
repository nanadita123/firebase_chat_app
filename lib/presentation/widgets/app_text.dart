import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign textAlign;

  const AppText(
      this.text, {
        super.key,
        required this.style,
        this.color,
        this.fontWeight,
        this.textAlign = TextAlign.start,
      });

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).textTheme.bodyMedium?.color;

    return Text(
      text,
      textAlign: textAlign,
      style: style.copyWith(
        color: color ?? style.color ?? themeColor,
        fontWeight: fontWeight ?? style.fontWeight,
      ),
    );
  }
}
