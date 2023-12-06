import 'package:ags/models/groupe.dart';
import 'package:ags/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ShowGroupe extends StatelessWidget {
  Groupe groupe;
  ShowGroupe({super.key, required this.groupe});

  @override
  Widget build(BuildContext context) {
    double longeur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(title: Text(groupe.titre)),
      body: Column(children: [
        SizedBox(height: longeur / 50.0),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Widgets.accueil_card(longeur, largeur, "Membres",
              "${groupe.nbrMembre} / ${groupe.nbrMembreTotal}", Icons.group),
          Widgets.accueil_card(
              longeur,
              largeur,
              "Freq Meeting",
              "Chaque ${groupe.frequenceMeet ?? 14} jours",
              Icons.calendar_month),
        ]),
        SizedBox(height: longeur / 90.0),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Widgets.accueil_card(longeur, largeur, "Forum", 12, Icons.forum),
          Widgets.accueil_card(longeur, largeur, "Prochain meet", "Mer 06/12 ",
              Icons.calendar_month),
        ]),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: largeur / 10.0, vertical: longeur / 50.0),
          child: const Divider(color: Colors.grey),
        ),
        Text(
          "Derniers messages",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: largeur / 15.0,
              color: Colors.grey[700]),
        ),
        // SizedBox(height: longeur / 50.0),
        Expanded(
          child: Card(
            color: Colors.white,
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.only(top: longeur / 50.0),
                    child: ListTile(
                      leading: Image.asset("assets/avatar.png"),
                      title: Text("Fouss Djo"),
                      subtitle: Text("Comment améliorer ma productivité ?"),
                    ),
                  );
                }),
          ),
        )
      ]),
    );
  }
}
