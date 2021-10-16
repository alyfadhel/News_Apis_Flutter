import 'package:flutter/material.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Sports Screen',
        style: Theme.of(context).textTheme.headline4!.copyWith(
          color: Colors.black,
          fontFamily: 'Jannah',
        ),
      ),
    );
  }
}
