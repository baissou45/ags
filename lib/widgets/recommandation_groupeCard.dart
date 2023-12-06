import 'package:ags/models/groupe.dart';
import 'package:flutter/material.dart';

class RecommandationGroupeCard extends StatelessWidget {
  Groupe groupe;
  String? demande;
  RecommandationGroupeCard({super.key, required this.groupe, this.demande});

  @override
  Widget build(BuildContext context) {
    double longeur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;

    return Card(
      elevation: 5.0,
      shadowColor: groupe.getInfo()["color"][200],
      child: Container(
        height: longeur / 7,
        width: largeur / 1.4,
        padding: EdgeInsets.symmetric(horizontal: largeur / 35.0),
        child: Column(children: [
          SizedBox(height: longeur / 60.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                groupe.titre,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: largeur / 25.0,
                    color: groupe.getInfo()["color"]),
              ),
              Icon(groupe.getInfo()["icon"], color: groupe.getInfo()["color"]),
            ],
          ),
          SizedBox(height: longeur / 90.0),
          Text(groupe.description),
          SizedBox(height: longeur / 50.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Membres : ${groupe.nbrMembre} / ${groupe.nbrMembreTotal}",
                style: TextStyle(color: groupe.getInfo()["color"]),
              ),
              if (demande != null) Text(demande!)
            ],
          ),
        ]),
      ),
    );
  }
}
