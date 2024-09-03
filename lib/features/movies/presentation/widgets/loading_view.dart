import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  final double vMargin;
  final Color? color;

  const AppLoading({
    super.key,
    this.vMargin = 0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vMargin),
      child: Center(
        child: Builder(
          builder: (context) {
            if (Platform.isIOS) {
              return const CupertinoActivityIndicator(
                color: Colors.teal,
              );
            }
            return const CircularProgressIndicator(
              strokeWidth: 1,
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.teal,
              ),
            );
          },
        ),
      ),
    );
  }
}
