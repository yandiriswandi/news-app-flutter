import 'package:core_component/config/color/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<bool?> swalFire({
  required BuildContext context,
  required String message,
  required String title,
}) {
  return showDialog<bool>(
    context: context,
    builder:
        (context) => AlertDialog(
          title: Text(title, style: GoogleFonts.poppins()),
          content: Text(message, style: GoogleFonts.poppins()),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(
                'Ya',
                style: GoogleFonts.poppins(color: AppColor.primaryColor),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(
                'Batal',
                style: GoogleFonts.poppins(color: AppColor.primaryColor),
              ),
            ),
          ],
        ),
  );
}
