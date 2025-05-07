import 'package:flutter/material.dart';

// void showToast(String message) {
//   Fluttertoast.showToast(
//     msg: message,
//     toastLength: Toast.LENGTH_SHORT,
//     gravity: ToastGravity.BOTTOM,
//     backgroundColor: Colors.black87,
//     textColor: Colors.white,
//     fontSize: 16.0,
//   );
// }

void showAppSnackBar({
  required BuildContext context,
  required String message,
  Color? backgroundColor,
  Color? textColor,
  IconData? icon,
  double iconSize = 20,
  double fontSize = 14,
  double marginTop = 20,
}) {
  final snackBar = SnackBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(top: marginTop, left: 16, right: 16),
    content: Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.red,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            icon ?? Icons.error,
            size: iconSize,
            color: textColor ?? Colors.white,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                fontSize: fontSize,
                color: textColor ?? Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
    duration: Duration(seconds: 3),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
