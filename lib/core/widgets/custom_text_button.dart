import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.backGroundColor,
    required this.foregroundColor,
    required this.child,
  });

  final void Function() onPressed;
  final Color backGroundColor;
  final Color foregroundColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: foregroundColor,
        backgroundColor: backGroundColor,
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 100,
        ),
      ),
      child: child,
    );
  }
}
