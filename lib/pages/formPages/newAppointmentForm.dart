class NewAppointmentFormPage extends StatelessWidget {
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