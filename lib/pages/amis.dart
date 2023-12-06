import 'package:ags/models/user.dart';
import 'package:ags/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Amis extends StatelessWidget {
  Amis({super.key});

  List<User> amis = [
    User(
        nom: "Fouss",
        prenom: "Djo",
        mail: "fouss.djo@gmail.com",
        centreInteret: ["Amour", "Corps"]),
    User(
        nom: "Archil",
        prenom: "Marie",
        mail: "fouss.djo@gmail.com",
        centreInteret: ["Amour", "Corps"]),
    User(
        nom: "Dupont",
        prenom: "Jean",
        mail: "jean.dupont@example.com",
        centreInteret: ["Amour", "Psychologie", "Finance"]),
    User(
        nom: "Martin",
        prenom: "Sophie",
        mail: "sophie.martin@example.com",
        centreInteret: ["Corps", "Psychologie", "Finance"]),
    User(
        nom: "Lefevre",
        prenom: "Paul",
        mail: "paul.lefevre@example.com",
        centreInteret: ["Finance"]),
    User(
        nom: "Dubois",
        prenom: "Marie",
        mail: "marie.dubois@example.com",
        centreInteret: ["Amour", "Corps"]),
    User(
        nom: "Leroy",
        prenom: "Thomas",
        mail: "thomas.leroy@example.com",
        centreInteret: ["Amour", "Corps", "Psychologie", "Finance"]),
    User(
        nom: "Girard",
        prenom: "Emma",
        mail: "emma.girard@example.com",
        centreInteret: ["Amour", "Corps", "Psychologie", "Finance"]),
    User(
        nom: "Moreau",
        prenom: "Luc",
        mail: "luc.moreau@example.com",
        centreInteret: ["Amour", "Finance"]),
    User(
        nom: "Petit",
        prenom: "Camille",
        mail: "camille.petit@example.com",
        centreInteret: ["Amour", "Psychologie", "Finance"]),
    User(
        nom: "Roux",
        prenom: "Hugo",
        mail: "hugo.roux@example.com",
        centreInteret: ["Amour", "Psychologie"]),
    User(
        nom: "Fournier",
        prenom: "Elise",
        mail: "elise.fournier@example.com",
        centreInteret: ["Amour", "Corps", "Psychologie", "Finance"]),
  ];

  @override
  Widget build(BuildContext context) {
    double longeur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;

    amis.shuffle();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Potentiels amis"),
        centerTitle: false,
      ),
      body: ListView.builder(
          padding: EdgeInsets.only(
              top: longeur / 80.0,
              left: largeur / 50,
              right: largeur / 50.0,
              bottom: longeur / 10),
          itemCount: amis.length,
          itemBuilder: (BuildContext context, int index) {
            return Widgets.userCard(longeur, largeur, amis[index]);
          }),
    );
  }
}
