import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'assets/my_icons_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
        Red(),
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

class NewReminderFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Nuova terapia'),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          shadowColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }
}

class NewMeasureFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Nuova misurazione'),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          shadowColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }
}

class Red extends StatefulWidget {
  @override
  _RedState createState() => _RedState();
}

class _RedState extends State<Red> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}

class Blue extends StatefulWidget {
  @override
  _BlueState createState() => _BlueState();
}

class _BlueState extends State<Blue> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
    );
  }
}

class Yellow extends StatefulWidget {
  @override
  _YellowState createState() => _YellowState();
}

class _YellowState extends State<Yellow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellowAccent,
    );
  }
}

class Green extends StatefulWidget {
  @override
  _GreenState createState() => _GreenState();
}

//AutomaticKeepAliveClientMixin per mantenere lo stato della pagina quando si va in un'altra pagina
class _GreenState extends State<Green> with AutomaticKeepAliveClientMixin<Green>{

  @override //Per AutomaticKeepAliveClientMixin
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); //Per AutomaticKeepAliveClientMixin
    return Container(
      color: Colors.green,
      child: const ListViewHome(),
    );
  }
}

class ListViewHome extends StatefulWidget {
  const ListViewHome({Key? key}) : super(key: key);

  @override
  State<ListViewHome> createState() => _ListViewHomeState();
}

class _ListViewHomeState extends State<ListViewHome> {
  final elements = [
    ListElement("Title 1", "Here is element 1 subtitle", Icons.monitor_heart),
    ListElement("Title 2", "Here is element 2 subtitle", Icons.monitor_heart),
    ListElement("Title 3", "Here is element 3 subtitle", Icons.monitor_heart)
  ];


  void removeTile(int index){
    setState(() {
      elements.remove(elements[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: elements.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.fromLTRB(5, 3, 5, 3),
            child: Card(
                margin: const EdgeInsets.all(0),
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Slidable(
                  key: UniqueKey(),
                  endActionPane: ActionPane(
                    dismissible: DismissiblePane(
                        onDismissed: () {
                          final dismissedElement = elements[index];
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(elements[index]._title + 'rimossa'),
                            action: SnackBarAction(
                              label: "Annulla",
                              onPressed: (){
                                setState(() {
                                  elements.insert(index, dismissedElement);
                                });
                              },
                            ),
                          ));
                          removeTile(index);
                        },
                    ),
                    extentRatio: 0.3,
                    motion: ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          final dismissedElement = elements[index];
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(elements[index]._title + ' rimossa'),
                            action: SnackBarAction(
                              label: "Annulla",
                              onPressed: (){
                                setState(() {
                                  elements.insert(index, dismissedElement);
                                });
                              },
                            ),
                          ));
                          removeTile(index);
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Elimina',
                      ),
                    ],
                  ),
                  child: Material(
                    elevation: 10,
                    shadowColor: Colors.black,
                    child: ListTile(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(elements[index]._title + ' pressed!'),
                          ));
                        },
                        title: Text(elements[index]._title),
                        subtitle: Text(elements[index]._subTitle),
                        leading: const CircleAvatar(
                          backgroundImage:
                              AssetImage('lib/assets/images/heart-rate.png'),
                          backgroundColor: Colors.transparent,
                        ),
                        trailing: Icon(elements[index]._icon)),
                  ),
                )),
          );
        });
  }
}

class ListElement {
  String _title;
  String _subTitle;
  IconData _icon;

  ListElement(this._title, this._subTitle, this._icon);

  IconData get icon => _icon;

  set icon(IconData value) {
    _icon = value;
  }

  String get subTitle => _subTitle;

  set subTitle(String value) {
    _subTitle = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }
}
