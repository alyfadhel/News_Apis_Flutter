import 'package:flutter/material.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Science Screen',
        style: Theme.of(context).textTheme.headline4!.copyWith(
          color: Colors.black,
          fontFamily: 'Jannah',
        ),
      ),
    );
  }
}
