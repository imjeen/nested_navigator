import 'package:flutter/material.dart';
import 'package:nested_navigator/widgets/color_detail.dart';
import 'package:nested_navigator/widgets/color_list.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  final MaterialColor color = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
        backgroundColor: color,
      ),
      body: ColorList(
        color: color,
        onTap: (materialIndex) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return Scaffold(
                appBar: AppBar(
                  title: Text('Colors.green[$materialIndex]'),
                  backgroundColor: color,
                ),
                body: ColorDetail(
                  color: color,
                  title: 'Colors.green[$materialIndex]',
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
