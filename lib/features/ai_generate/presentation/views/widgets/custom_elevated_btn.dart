import 'package:flutter/material.dart';

class CustomElvatedButton extends StatelessWidget {
  const CustomElvatedButton({
    super.key,
    this.onPressed,
    required this.child,
    this.bgColor,
  });
  final void Function()? onPressed;
  final Widget child;
  final Color? bgColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.grey[800],
        backgroundColor: bgColor ?? Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
