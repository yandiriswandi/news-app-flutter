import 'package:core_component/config/color/color.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.backgroundColor,
    this.textColor,
    this.onPressed,
    this.borderRadius,
    this.side,
    required this.text,
  });

  final Color? backgroundColor;
  final Color? textColor;
  final void Function()? onPressed;
  final BorderSide? side;
  final BorderRadius? borderRadius;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColor.primaryColor,
          shape: RoundedRectangleBorder(
            side: side ?? BorderSide.none,
            borderRadius: borderRadius ?? BorderRadius.circular(8),
          ),
        ),
        child: Text(text, style: TextStyle(color: textColor ?? Colors.white)),
      ),
    );
  }
}
