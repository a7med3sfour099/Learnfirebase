import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color color;
  final Color textColor;
  const CustomAuthButton({
    super.key,
    this.onPressed,
    required this.text,
    required this.color, required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () {},
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: color,
        fixedSize: Size(double.infinity, 50),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
