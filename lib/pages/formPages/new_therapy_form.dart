import 'package:flutter/material.dart';

class NewTherapyForm extends StatelessWidget {
  const NewTherapyForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nuova terapia'),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          shadowColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }
}