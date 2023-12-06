import 'package:ags/models/groupe.dart';
import 'package:ags/pages/groupe/tabs/info_groupe.dart';
import 'package:ags/pages/show_groupe.dart';
import 'package:ags/widgets/recommandation_groupeCard.dart';
import 'package:ags/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ListGroupe extends StatelessWidget {
  ListGroupe({super.key});

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
        nbrMembre: 1,
        nbrMembreTotal: 2,
        categorie: "Finance"),
    Groupe(
        titre: "Esprit monnetaire 2",
        description:
            "Sommaire Nombreuses sont celles qui, un jour ou l'autre, ont rencontré, ...",
        nbrMembre: 4,
        nbrMembreTotal: 5,
        categorie: "Finance"),
    Groupe(
        titre: "Esprit monnetaire 3",
        description:
            "Sommaire Nombreuses sont celles qui, un jour ou l'autre, ont rencontré, ...",
        nbrMembre: 2,
        nbrMembreTotal: 3,
        categorie: "Finance"),
    Groupe(
        titre: "Les scientifiques",
        description:
            "Sommaire Nombreuses sont celles qui, un jour ou l'autre, ont rencontré, ...",
        nbrMembre: 4,
        nbrMembreTotal: 5,
        categorie: "Psychologie"),
    Groupe(
        titre: "Les scientifiques 2",
        description:
            "Sommaire Nombreuses sont celles qui, un jour ou l'autre, ont rencontré, ...",
        nbrMembre: 2,
        nbrMembreTotal: 5,
        categorie: "Psychologie"),
    Groupe(
        titre: "Les scientifiques 3",
        description:
            "Sommaire Nombreuses sont celles qui, un jour ou l'autre, ont rencontré, ...",
        nbrMembre: 1,
        nbrMembreTotal: 2,
        categorie: "Psychologie"),
  ];

  @override
  Widget build(BuildContext context) {
    groupes.shuffle();

    return Scaffold(
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: groupes.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Widgets.dialoge(context, InfoGroupe(groupe: groupes[index]),
                      groupes[index].titre);
                },
                child: RecommandationGroupeCard(groupe: groupes[index]),
              );
            }));
  }
}
