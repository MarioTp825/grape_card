import 'package:flutter/material.dart';
import 'package:grape_card/config/grape_theme.dart';

class GrapeDivider extends StatelessWidget {
  final double height;

  const GrapeDivider({super.key, this.height = 5});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
            color: context.themeColors.primary
        ),
        borderRadius: BorderRadius.circular(height),
        color: context.themeColors.primary,
      ),
    );
  }
}
