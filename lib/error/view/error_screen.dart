import 'package:flutter/material.dart';
import 'package:grape_card/config/grape_theme.dart';

class ErrorScreen extends StatelessWidget {
  final String message;

  const ErrorScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 50,
            ),
            Text(
              "An unexpected error has occurred!!",
              style: context.themeFonts.displayLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              message,
              style: context.themeFonts.bodyLarge,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
