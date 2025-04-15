import 'package:flutter/material.dart';

class CustomGestureButton extends StatefulWidget {
  final Widget child;
  final Function() onTap;
  final Function()? onDoubleTap;
  final Function()? onLongPress;
  final Color? splashColor;
  final Color? highlightColor;
  final BorderRadius? borderRadius;

  const CustomGestureButton({
    Key? key,
    required this.child,
    required this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.splashColor,
    this.highlightColor,
    this.borderRadius,
  }) : super(key: key);

  @override
  _CustomGestureButtonState createState() => _CustomGestureButtonState();
}

class _CustomGestureButtonState extends State<CustomGestureButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onDoubleTap: widget.onDoubleTap,
      onLongPress: widget.onLongPress,
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: Opacity(
        opacity: _isPressed ? 0.7 : 1.0,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onTap,
            splashColor: widget.splashColor ?? Colors.grey.withOpacity(0.3),
            highlightColor: widget.highlightColor ?? Colors.transparent,
            borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

// Button with a scale animation
class ScaleButton extends StatefulWidget {
  final Widget child;
  final Function() onTap;
  final Duration duration;
  final double scaleValue;

  const ScaleButton({
    Key? key,
    required this.child,
    required this.onTap,
    this.duration = const Duration(milliseconds: 150),
    this.scaleValue = 0.95,
  }) : super(key: key);

  @override
  _ScaleButtonState createState() => _ScaleButtonState();
}

class _ScaleButtonState extends State<ScaleButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: widget.scaleValue,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _controller.forward();
      },
      onTapUp: (_) {
        _controller.reverse();
        widget.onTap();
      },
      onTapCancel: () {
        _controller.reverse();
      },
      child: ScaleTransition(scale: _scaleAnimation, child: widget.child),
    );
  }
}
