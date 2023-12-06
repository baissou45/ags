import 'package:ags/pages/groupe/create_groupe.dart';
import 'package:ags/pages/groupe/tabs/list_groupes.dart';
import 'package:ags/pages/groupe/tabs/mes_demandes.dart';
import 'package:ags/pages/groupe/tabs/mes_groupes.dart';
import 'package:ags/widgets/widgets.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TabsGroupe extends StatelessWidget {
  const TabsGroupe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mes groupes"),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {
                Widgets.dialoge(
                    context, const CreateGroupe(), "Nouveau groupe");
              },
              icon: const Icon(Icons.group_add))
        ],
      ),
      body: ContainedTabBarView(
          tabBarProperties: TabBarProperties(
              background: Container(
            color: Colors.blue[50],
          )),
          tabs: const [
            Text('Mes groupes', style: TextStyle(color: Colors.black)),
            Text('List groupes', style: TextStyle(color: Colors.black)),
            Text('Mes demandes', style: TextStyle(color: Colors.black))
          ],
          views: [
            MesGroupes(),
            ListGroupe(),
            MesDemandes()
          ]),
    );
  }
}
