import 'package:flutter/material.dart';
import '../utils/constants.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;
  final Color? backgroundColor;
  final Color? iconColor;
  final double size;
  final double iconSize;

  const CustomIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.iconColor,
    this.size = 40.0,
    this.iconSize = 24.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: IconButton(
        icon: Icon(icon, size: iconSize, color: iconColor ?? PRIMARY_COLOR),
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        splashRadius: size / 2,
        tooltip: 'Tombol',
      ),
      decoration:
          backgroundColor != null
              ? BoxDecoration(color: backgroundColor, shape: BoxShape.circle)
              : null,
    );
  }
}
