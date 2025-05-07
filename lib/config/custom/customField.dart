import 'package:core_component/config/color/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    required this.label,
    this.handleController,
    this.validator,
  });
  final String label;
  final dynamic handleController;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        controller: handleController,
        validator: validator,
        style: GoogleFonts.poppins(
          // ✅ Ini untuk teks yang diketik user
          fontSize: 15,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          label: Text(
            label,
            style: GoogleFonts.poppins(
              color: const Color(0xffC0C0C0),
              fontSize: 15,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              12,
            ), // ✅ Border radius saat tidak fokus
            borderSide: const BorderSide(color: Color(0xffC0C0C0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              12,
            ), // ✅ Border radius saat fokus
            borderSide: BorderSide(
              color: AppColor.primaryColor ?? Color(0xff3498DB),
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
