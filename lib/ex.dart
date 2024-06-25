import 'package:flutter/material.dart';
import 'package:wall_art/utils/image_path.dart';

class ExampleW extends StatefulWidget {
  const ExampleW({super.key});

  @override
  State<ExampleW> createState() => _ExampleWState();
}

class _ExampleWState extends State<ExampleW> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          PathToImage.onBoard3,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
