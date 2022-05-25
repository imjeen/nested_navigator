import 'package:flutter/material.dart';
import 'package:nested_navigator/widgets/color_detail.dart';
import 'package:nested_navigator/widgets/color_list.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  final MaterialColor color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
        backgroundColor: color,
      ),
      body: ColorList(
        color: color,
        onTap: (materialIndex) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return Scaffold(
                appBar: AppBar(
                  title: Text('Colors.red[$materialIndex]'),
                  backgroundColor: color,
                ),
                body: ColorDetail(
                  color: color,
                  title: 'Colors.red[$materialIndex]',
                  materialIndex: materialIndex,
                ),
              );
            },
          ));
        },
      ),
    );
  }
}
