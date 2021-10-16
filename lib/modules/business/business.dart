import 'package:flutter/material.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Business Screen',
        style: Theme.of(context).textTheme.headline4!.copyWith(
          color: Colors.black,
          fontFamily: 'Jannah',
        ),
      ),
    );
  }
}
