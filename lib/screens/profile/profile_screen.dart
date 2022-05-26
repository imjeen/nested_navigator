import 'package:flutter/material.dart';
import 'package:nested_navigator/screens/edit_profile/edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('profile screen'),
        ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditProfileScreen.routeName);
              },
              child: const Text('go to Feed page'),
            ),
      ],
    );
  }
}
