import 'package:flutter/material.dart';

class FullscreenLoader extends StatelessWidget {
  const FullscreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        // Latar belakang semi transparan
        Opacity(
          opacity: 0.6,
          child: ModalBarrier(dismissible: false, color: Colors.black),
        ),
        // Spinner di tengah layar
        Center(child: CircularProgressIndicator(color: Colors.white)),
      ],
    );
  }
}
