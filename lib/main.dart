import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'assets/my_icons_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'pages/homePage.dart';
import 'pages/measurementPage.dart';
import 'pages/therapyPage.dart';
import 'pages/appointementsPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MemoMed',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Flutter Demo'),
      routes: {
        '/newMeasureFormPage': (context) => NewMeasureFormPage(),
        '/newReminderFormPage': (context) => NewReminderFormPage(),
        '/newAppointmentFormPage': (context) => NewAppointmentFormPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required String title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      const BottomNavigationBarItem(
        icon: Icon(Icons.calendar_month_rounded),
        label: 'Visite',
      ),
      const BottomNavigationBarItem(
        icon: Icon(MyIcons.pills),
        label: 'Terapie',
      ),
      const BottomNavigationBarItem(
        icon: Icon(MyIcons.monitoring),
        label: 'Misurazioni',
      )
    ];
  }

  Widget? buildFAB(BuildContext context, int index) {
    switch (index) {
      case 0:
        return SpeedDial(
          icon: Icons.add,
          activeIcon: Icons.close,
          children: [
            SpeedDialChild(
              child: const Icon(Icons.edit_calendar_rounded),
              label: "Visita medica",
              onTap: () =>
                  Navigator.pushNamed(context, '/newAppointmentFormPage'),
            ),
            SpeedDialChild(
              child: const Icon(MyIcons.add_pill),
              label: "Terapia",
              onTap: () => Navigator.pushNamed(context, '/newReminderFormPage'),
            ),
            SpeedDialChild(
              child: const Icon(MyIcons.add_measure),
              label: "Misurazione",
              onTap: () => Navigator.pushNamed(context, '/newMeasureFormPage'),
            )
          ],
        );
      case 1:
        return FloatingActionButton(
            child: const Icon(Icons.edit_calendar_rounded),
            onPressed: () =>
                Navigator.pushNamed(context, '/newAppointmentFormPage'));
      case 2:
        return FloatingActionButton(
            child: const Icon(MyIcons.add_pill),
            onPressed: () =>
                Navigator.pushNamed(context, '/newReminderFormPage'));
      case 3:
        return FloatingActionButton(
            child: const Icon(MyIcons.add_measure),
            onPressed: () =>
                Navigator.pushNamed(context, '/newMeasureFormPage'));
      default:
        return null;
    }
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        HomePage(),
        Blue(),
        Yellow(),
        Green(),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void pageChanged(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      currentPageIndex = index;
      pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: buildPageView(),
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.only(right: 60),
          child: BottomNavigationBar(
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.black38,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            currentIndex: currentPageIndex,
            onTap: (index) {
              bottomTapped(index);
            },
            items: buildBottomNavBarItems(),
            elevation: 0,
          ),
        ),
      ),
      floatingActionButton: buildFAB(context, currentPageIndex),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      extendBody: true,
    ));
  }
}

