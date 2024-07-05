import 'package:flutter/material.dart';

class BlueGreenContainer extends StatelessWidget {
  Widget child;
  BlueGreenContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        // gradient: LinearGradient(
        //   colors: [Colors.blue, Colors.green],
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        // ),
        gradient: LinearGradient(
          colors: [Colors.black, Colors.cyan],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: child,
    );
  }
}
