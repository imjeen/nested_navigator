import 'package:flutter/material.dart';
import 'package:nested_navigator/widgets/color_detail.dart';
import 'package:nested_navigator/widgets/color_list.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  final MaterialColor color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a new post'),
        backgroundColor: color,
      ),
      body: ColorList(
        color: color,
        onTap: (materialIndex) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return Scaffold(
                appBar: AppBar(
                  title: Text('Colors.blue[$materialIndex]'),
                  backgroundColor: color,
                ),
                body: ColorDetail(
                  color: color,
                  title: 'Colors.blue[$materialIndex]',
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
