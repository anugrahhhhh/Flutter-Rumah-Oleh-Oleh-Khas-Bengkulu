import 'package:flutter/cupertino.dart';
import '../utils/constants.dart';

class CustomCupertinoButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color? color;
  final Color? textColor;
  final double? width;
  final double height;
  final bool filled;

  const CustomCupertinoButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.width,
    this.height = 48.0,
    this.filled = true,
  }) : super(key: key);

  get ACCENT_COLOR => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child:
          filled
              ? CupertinoButton.filled(
                onPressed: onPressed,
                child: Text(
                  text,
                  style: TextStyle(
                    color: textColor ?? CupertinoColors.white,
                    fontSize: 16,
                  ),
                ),
                padding: EdgeInsets.zero,
              )
              : CupertinoButton(
                onPressed: onPressed,
                child: Text(
                  text,
                  style: TextStyle(
                    color: textColor ?? ACCENT_COLOR,
                    fontSize: 16,
                  ),
                ),
                padding: EdgeInsets.zero,
              ),
    );
  }
}
