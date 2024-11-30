import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;
  final double borderRadius;
  final TextStyle textStyle;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.color = Colors.blue,
    this.borderRadius = 8.0,
    this.textStyle = const TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(
          child: Text(
            text,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
