import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Setting Screen',
        style: Theme.of(context).textTheme.headline4!.copyWith(
          color: Colors.black,
          fontFamily: 'Jannah',
        ),
      ),
    );
  }
}
