import 'package:flutter/material.dart';

import '../entity/measurementEntity.dart';

class MeasurementPage extends StatefulWidget {
  @override
  _MeasurementPageState createState() => _MeasurementPageState();
}

//AutomaticKeepAliveClientMixin per mantenere lo stato della pagina quando si va in un'altra pagina
class _MeasurementPageState extends State<MeasurementPage> with AutomaticKeepAliveClientMixin<MeasurementPage>{

  @override //Per AutomaticKeepAliveClientMixin
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); //Per AutomaticKeepAliveClientMixin
    return Container(
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
    Measurement("Title 1", "Here is element 1 subtitle", Icons.monitor_heart),
    Measurement("Title 2", "Here is element 2 subtitle", Icons.monitor_heart),
    Measurement("Title 3", "Here is element 3 subtitle", Icons.monitor_heart)
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