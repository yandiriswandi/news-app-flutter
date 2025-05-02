import 'package:core_component/screen/auth/getstarted/getStarted.dart';
import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // ⬅️ vertikal tengah
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Settings Page"),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => GetStarted()),
                    (route) => false, // Menghapus semua rute sebelumnya
                  );
                },
                child: Text("Logout"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
