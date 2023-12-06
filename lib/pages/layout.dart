import 'package:ags/pages/accueil.dart';
import 'package:ags/pages/amis.dart';
import 'package:ags/pages/groupe/tabs/mes_groupes.dart';
import 'package:ags/pages/groupe/tabs_groupe.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';

class Layout extends StatefulWidget {
  const Layout({
    Key? key,
    this.title,
  }) : super(key: key);
  final String? title;

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int selectedPos = 0;

  double bottomNavBarHeight = 60;

  List pages = [
    const Accueil(),
    const TabsGroupe(),
    Amis(),
    Container(color: Colors.red),
  ];

  List<TabItem> tabItems = List.of([
    TabItem(
      Icons.home,
      "Accueil",
      Colors.blue,
      labelStyle: const TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
      ),
    ),
    TabItem(
      Icons.group,
      "Mes groupes",
      Colors.blue,
      labelStyle: const TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
      ),
    ),
    TabItem(
      Icons.person,
      "Amis",
      Colors.blue,
      circleStrokeColor: Colors.white,
    ),
    TabItem(
      Icons.calendar_month,
      "Schedule",
      Colors.blue,
      labelStyle: const TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
      ),
    ),
  ]);

  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            child: pages[selectedPos],
            padding: EdgeInsets.only(bottom: bottomNavBarHeight - 40),
          ),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      selectedPos: selectedPos,
      barHeight: bottomNavBarHeight,
      // use either barBackgroundColor or barBackgroundGradient to have a gradient on bar background
      barBackgroundColor: Colors.white,
      // barBackgroundGradient: LinearGradient(
      //   begin: Alignment.bottomCenter,
      //   end: Alignment.topCenter,
      //   colors: [
      //     Colors.blue,
      //     Colors.red,
      //   ],
      // ),
      backgroundBoxShadow: <BoxShadow>[
        BoxShadow(color: Colors.black45, blurRadius: 10.0),
      ],
      animationDuration: Duration(milliseconds: 300),
      selectedCallback: (int? selectedPos) {
        setState(() {
          this.selectedPos = selectedPos ?? 0;
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}
