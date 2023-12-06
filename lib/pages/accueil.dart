import 'package:ags/models/groupe.dart';
import 'package:ags/pages/groupe/tabs/list_groupes.dart';
import 'package:ags/pages/groupe/tabs/mes_groupes.dart';
import 'package:ags/widgets/recommandation_groupeCard.dart';
import 'package:ags/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    double longeur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;

    List<Groupe> groupes = ListGroupe.groupes;
    groupes.shuffle();

    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
          child: Column(children: [
        Padding(
          padding: EdgeInsets.only(
              left: largeur / 30.0, right: largeur / 30.0, top: longeur / 60.0),
          child: Row(
            children: [
              Image.asset("assets/avatar.png", width: largeur / 7.0),
              SizedBox(width: largeur / 30.0),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Fouss Djo",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "fouss.djo@gmail.com",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: longeur / 50.0),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Widgets.accueil_card(longeur, largeur, "Mes groupes", 3, Icons.group),
          Widgets.accueil_card(
              longeur, largeur, "Groupes membre", 10, Icons.group_outlined),
        ]),
        SizedBox(height: longeur / 90.0),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Widgets.accueil_card(longeur, largeur, "Objectifs restant", 12,
              Icons.ads_click_rounded),
          Widgets.accueil_card(
              longeur, largeur, "Réunions hebdo", 4, Icons.calendar_month),
        ]),
        SizedBox(height: longeur / 50.0),
        Expanded(
          child: Container(
            width: largeur,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                )),
            child: Column(children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: longeur / 30.0),
                child: Text(
                  "Mes recommandation de groupe",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: largeur / 20.0),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: largeur / 45.0),
                  child: Row(
                    children: [
                      RecommandationGroupeCard(groupe: groupes[0]),
                      RecommandationGroupeCard(groupe: groupes[1]),
                      RecommandationGroupeCard(groupe: groupes[2]),
                    ],
                  ),
                ),
              ),
              SizedBox(height: longeur / 50.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: largeur / 45.0),
                  child: Row(
                    children: [
                      RecommandationGroupeCard(groupe: groupes[3]),
                      RecommandationGroupeCard(groupe: groupes[4]),
                      RecommandationGroupeCard(groupe: groupes[5]),
                    ],
                  ),
                ),
              )
            ]),
          ),
        )
      ])),
    );
  }
}
