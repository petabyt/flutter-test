import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Help'),
        ),
        body: Center(
          child: Text(
            'Doh',
          ),
        ),
      );
  }
}
