import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DividerText extends StatelessWidget {
  const DividerText({super.key, required this.text, this.color});

  final String text;
  final int? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Color(color ?? 0xffC0C0C0), height: 3)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            text,
            style: GoogleFonts.poppins(color: Color(color ?? 0xffC0C0C0)),
          ),
        ),
        Expanded(child: Divider(color: Color(color ?? 0xffC0C0C0), height: 3)),
      ],
    );
  }
}
