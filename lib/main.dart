import 'package:core_component/config/theme/theme.dart';
import 'package:core_component/screen/auth/getstarted/getStarted.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: GetStarted(), theme: themeData);
  }
}
