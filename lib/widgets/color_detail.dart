import 'package:flutter/material.dart';

class ColorDetail extends StatelessWidget {
  final MaterialColor color;
  final int materialIndex;
  final String? title;

  const ColorDetail({
    Key? key,
    required this.color,
    this.title,
    this.materialIndex = 500,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color[materialIndex],
      child: Center(
        child: Text(
          title ?? '$color[$materialIndex]',
          style: const TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }
}
