import 'package:ags/pages/layout.dart';
import 'package:ags/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChoixCategorie extends StatefulWidget {
  const ChoixCategorie({super.key});

  @override
  State<ChoixCategorie> createState() => _ChoixCategorieState();
}

class _ChoixCategorieState extends State<ChoixCategorie> {
  List<bool> choix = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    double longeur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Card(
          elevation: 2.0,
          child: SizedBox(
            width: largeur / 1.2,
            height: longeur / 1.5,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: longeur / 50.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Veuillez choisir vos centres d'intérêt",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: largeur / 19.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                            onTap: () {
                              setState(() {
                                choix[0] = !choix[0];
                              });
                            },
                            child: Widgets.categorie_card(longeur, largeur,
                                "Corps", Icons.man, Colors.brown, choix[0])),
                        InkWell(
                          onTap: () {
                            setState(() {
                              choix[1] = !choix[1];
                            });
                          },
                          child: Widgets.categorie_card(
                              longeur,
                              largeur,
                              "Psychologie",
                              Icons.psychology,
                              Colors.deepPurple,
                              choix[1]),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              choix[2] = !choix[2];
                            });
                          },
                          child: Widgets.categorie_card(
                              longeur,
                              largeur,
                              "Amour",
                              CupertinoIcons.heart_fill,
                              Colors.red,
                              choix[2]),
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                choix[3] = !choix[3];
                              });
                            },
                            child: Widgets.categorie_card(
                                longeur,
                                largeur,
                                "Finance",
                                Icons.attach_money,
                                Colors.green,
                                choix[3]))
                      ],
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Widgets.fullNavigate(context, const Layout());
                        },
                        child: const Text("Continuer"))
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
