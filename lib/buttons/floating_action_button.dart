import 'package:flutter/material.dart';
import '../utils/constants.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;
  final Color? backgroundColor;
  final Color? iconColor;
  final double size;
  final String? tooltip;

  const CustomFloatingActionButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.iconColor,
    this.size = 56.0,
    this.tooltip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: backgroundColor ?? PRIMARY_COLOR,
        foregroundColor: iconColor ?? Colors.white,
        tooltip: tooltip,
        elevation: 4.0,
        child: Icon(icon),
      ),
    );
  }
}
