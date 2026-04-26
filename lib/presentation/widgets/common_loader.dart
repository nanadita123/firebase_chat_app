import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class CommonSpinkit extends StatelessWidget {
  const CommonSpinkit({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFadingCircle(
        size: 40,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
