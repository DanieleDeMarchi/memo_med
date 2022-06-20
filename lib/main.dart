import 'package:flutter/material.dart';
import 'package:memo_med/widget/switchable_fab.dart';
import 'assets/my_icons_icons.dart';

import 'package:memo_med/pages/formPages/new_measure_form.dart';
import 'package:memo_med/pages/formPages/new_appointment_form.dart';
import 'package:memo_med/pages/formPages/new_therapy_form.dart';

import 'package:memo_med/pages/home_page.dart';
import 'package:memo_med/pages/measurement_page.dart';
import 'package:memo_med/pages/therapy_page.dart';
import 'package:memo_med/pages/appointments_page.dart';

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
      home: const MainPage(title: 'Flutter Demo'),
      routes: {
        '/newMeasure': (context) => NewMeasureForm(),
        '/newTherapy': (context) => NewTherapyForm(),
        '/newAppointment': (context) => NewAppointmentForm(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required String title}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
        AppointmentsPage(),
        TherapyPage(),
        MeasurementsPage(),
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
        floatingActionButton: SwitchableFab(currentPageIndex),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        extendBody: true,
      )
    );
  }
}
