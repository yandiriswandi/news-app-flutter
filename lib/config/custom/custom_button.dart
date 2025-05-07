import 'package:core_component/config/color/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.backgroundColor,
    this.textColor,
    this.onPressed,
    this.borderRadius,
    this.side,
    required this.text,
    this.isLoading = false,
    this.height = 40,
    this.width = 40,
    this.fontSize = 15,
    this.fontWeight,
  });

  final Color? backgroundColor;
  final Color? textColor;
  final void Function()? onPressed;
  final BorderSide? side;
  final BorderRadius? borderRadius;
  final String text;
  final bool isLoading;
  final double height;
  final double width;
  final double fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isLoading
                  ? (backgroundColor ?? AppColor.primaryColor).withOpacity(0.6)
                  : (backgroundColor ?? AppColor.primaryColor),

          shape: RoundedRectangleBorder(
            side: side ?? BorderSide.none,
            borderRadius: borderRadius ?? BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading)
              Container(
                margin: const EdgeInsets.only(right: 8),
                width: 20,
                height: 20,
                child: const CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            Text(
              text,
              style: GoogleFonts.poppins(
                color: textColor ?? Colors.white,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
