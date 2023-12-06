import 'package:ags/models/groupe.dart';
import 'package:ags/pages/groupe/create_groupe.dart';
import 'package:ags/pages/show_groupe.dart';
import 'package:ags/widgets/recommandation_groupeCard.dart';
import 'package:ags/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MesDemandes extends StatelessWidget {
  MesDemandes({super.key});

  static List<Groupe> groupes = [
    Groupe(
        titre: "Coin des séducteurs",
        description:
            "Sommaire Nombreuses sont celles qui, un jour ou l'autre, ont rencontré, ...",
        nbrMembre: 1,
        nbrMembreTotal: 3,
        categorie: "Amour"),
    Groupe(
        titre: "Esprit monnetaire",
        description:
            "Sommaire Nombreuses sont celles qui, un jour ou l'autre, ont rencontré, ...",
        nbrMembre: 2,
        nbrMembreTotal: 2,
        categorie: "Finance"),
    Groupe(
        titre: "Les scientifiques",
        description:
            "Sommaire Nombreuses sont celles qui, un jour ou l'autre, ont rencontré, ...",
        nbrMembre: 4,
        nbrMembreTotal: 5,
        categorie: "Psychologie"),
  ];

  @override
  Widget build(BuildContext context) {
    double longeur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: longeur / 90.0),
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: groupes.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(bottom: longeur / 150.0),
                child: RecommandationGroupeCard(
                  groupe: groupes[index],
                  demande: "En attente",
                ),
              );
            }),
      ),
    );
  }
}
