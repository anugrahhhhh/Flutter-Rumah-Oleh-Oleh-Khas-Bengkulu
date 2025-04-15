import 'package:flutter/material.dart';
import '../utils/constants.dart';

class CustomFlatButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color? textColor;
  final IconData? icon;
  final double? width;
  final double height;

  const CustomFlatButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.textColor,
    this.icon,
    this.width,
    this.height = 48.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: textColor ?? PRIMARY_COLOR,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child:
            icon != null
                ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon),
                    SizedBox(width: 8),
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
                : Text(
                  text,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
      ),
    );
  }
}
