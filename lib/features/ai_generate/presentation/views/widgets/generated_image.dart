import 'dart:typed_data';

import 'package:flutter/material.dart';

class GeneratedImage extends StatelessWidget {
  const GeneratedImage({super.key, required this.image});
  final Uint8List image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.memory(
          image,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 300,
        ),
      ),
    );
  }
}
