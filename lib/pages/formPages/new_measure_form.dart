import 'package:flutter/material.dart';

class NewMeasureForm extends StatelessWidget {
  const NewMeasureForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nuova misurazione'),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          shadowColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }
}