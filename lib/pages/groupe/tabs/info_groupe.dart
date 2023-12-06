import 'package:ags/models/groupe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoGroupe extends StatelessWidget {
  Groupe groupe;
  InfoGroupe({super.key, required this.groupe});

  @override
  Widget build(BuildContext context) {
    double longeur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;

    return SizedBox(
      height: longeur / 3,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text(
          groupe.description,
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Membre ${groupe.nbrMembre} / ${groupe.nbrMembreTotal}"),
            Text(
              groupe.categorie,
              style: TextStyle(color: groupe.getInfo()['color']),
            ),
          ],
        ),
        ElevatedButton(
            onPressed: () {}, child: const Text("Envoyer une demande"))
      ]),
    );
  }
}
