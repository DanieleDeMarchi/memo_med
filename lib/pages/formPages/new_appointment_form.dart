import 'package:flutter/material.dart';

class NewAppointmentForm extends StatelessWidget {
  const NewAppointmentForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Nuova visita'),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          shadowColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }
}