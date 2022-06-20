import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:memo_med/assets/my_icons_icons.dart';

class SwitchableFab extends StatefulWidget {
  const SwitchableFab(this.currentIndex, {Key? key}) : super(key: key);

  final int currentIndex;

  @override
  State<SwitchableFab> createState() => _SwitchableFabState();
}

class _SwitchableFabState extends State<SwitchableFab> {

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
                  Navigator.pushNamed(context, '/newAppointment'),
            ),
            SpeedDialChild(
              child: const Icon(MyIcons.add_pill),
              label: "Terapia",
              onTap: () => Navigator.pushNamed(context, '/newTherapy'),
            ),
            SpeedDialChild(
              child: const Icon(MyIcons.add_measure),
              label: "Misurazione",
              onTap: () => Navigator.pushNamed(context, '/newMeasure'),
            )
          ],
        );
      case 1:
        return FloatingActionButton(
            key: UniqueKey(),
            child: const Icon(Icons.edit_calendar_rounded),
            onPressed: () =>
                Navigator.pushNamed(context, '/newAppointment'));
      case 2:
        return FloatingActionButton(
            key: UniqueKey(),
            child: const Icon(MyIcons.add_pill),
            onPressed: () =>
                Navigator.pushNamed(context, '/newTherapy'));
      case 3:
        return FloatingActionButton(
            key: UniqueKey(),
            child: const Icon(MyIcons.add_measure),
            onPressed: () =>
                Navigator.pushNamed(context, '/newMeasure'));
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: buildFAB(context, widget.currentIndex),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(scale: animation, child: child);
      }
    );
  }
}
