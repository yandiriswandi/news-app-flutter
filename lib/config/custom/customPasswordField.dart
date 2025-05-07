import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    super.key,
    required this.label,
    this.handleController,
    this.validator,
  });

  final String label;
  final TextEditingController? handleController;
  final FormFieldValidator<String>? validator;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        controller: widget.handleController,
        validator: widget.validator,
        obscureText: _obscureText,
        style: GoogleFonts.poppins(fontSize: 15, color: Colors.black),
        decoration: InputDecoration(
          label: Text(
            widget.label,
            style: GoogleFonts.poppins(
              color: const Color(0xffC0C0C0),
              fontSize: 15,
            ),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
            onPressed: _toggleVisibility,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xffC0C0C0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xff3498DB), width: 2),
          ),
        ),
      ),
    );
  }
}
