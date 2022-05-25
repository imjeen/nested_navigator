import 'package:flutter/material.dart';

class ColorList extends StatelessWidget {
  final MaterialColor color;
  final ValueChanged<int>? onTap;

  ColorList({
    Key? key,
    required this.color,
    this.onTap,
  }) : super(key: key);

  final List<int> materialIndices = [
    900,
    800,
    700,
    600,
    500,
    400,
    300,
    200,
    100,
    50,
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: materialIndices.length,
      itemBuilder: (context, index) {
        int materialIndex = materialIndices[index];
        return Container(
          color: color[materialIndex],
          child: ListTile(
            title: Text(
              '$materialIndex',
              style: const TextStyle(fontSize: 24.0),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              onTap?.call(materialIndex);
            },
          ),
        );
      },
    );
  }
}
