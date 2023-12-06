import 'package:ags/models/groupe.dart';
import 'package:ags/services/groupe_services.dart';
import 'package:ags/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateGroupe extends StatefulWidget {
  const CreateGroupe({super.key});

  @override
  State<CreateGroupe> createState() => _CreateGroupeState();
}

class _CreateGroupeState extends State<CreateGroupe> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nomController = TextEditingController();
  final _descController = TextEditingController();
  final _freqMeetController = TextEditingController();
  final _freqObjController = TextEditingController();
  final _totalController = TextEditingController();

  List<bool> choix = [false, false, false, false];
  bool load = false;

  @override
  Widget build(BuildContext context) {
    double longeur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Form(
        key: _formKey,
        child: load
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: SizedBox(
                  height: longeur / 1.35,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // const Text("Informations du groupe"),
                        TextFormField(
                          controller: _nomController,
                          validator: (value) {
                            if (_nomController.text.isEmpty) {
                              return "Ce champ est obligatoir";
                            }

                            return null;
                          },
                          decoration: const InputDecoration(
                            label: Text("Nom du groupe"),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          controller: _descController,
                          validator: (value) {
                            if (_descController.text.isEmpty) {
                              return "Ce champ est obligatoir";
                            }

                            return null;
                          },
                          decoration: const InputDecoration(
                            label: Text("Description"),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: _freqMeetController,
                          validator: (value) {
                            if (_nomController.text.isEmpty) {
                              return "Ce champ est obligatoir";
                            }

                            return null;
                          },
                          decoration: const InputDecoration(
                            label: Text("Frequence meeting en j"),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        TextFormField(
                          controller: _freqObjController,
                          keyboardType: TextInputType.multiline,
                          validator: (value) {
                            if (_freqObjController.text.isEmpty) {
                              return "Ce champ est obligatoir";
                            }

                            return null;
                          },
                          decoration: const InputDecoration(
                            label: Text("Frequence objectif en j"),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        TextFormField(
                          controller: _totalController,
                          keyboardType: TextInputType.multiline,
                          validator: (value) {
                            if (_totalController.text.isEmpty) {
                              return "Ce champ est obligatoir";
                            }

                            return null;
                          },
                          decoration: const InputDecoration(
                            label: Text("Nombre total membre"),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const Text("categorie"),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                    onTap: () {
                                      setState(() {
                                        choix[0] = !choix[0];
                                      });
                                    },
                                    child: Widgets.categorie_card(
                                        longeur / 2,
                                        largeur / 1.3,
                                        "Corps",
                                        Icons.man,
                                        Colors.brown,
                                        choix[0])),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      choix[1] = !choix[1];
                                    });
                                  },
                                  child: Widgets.categorie_card(
                                      longeur / 2,
                                      largeur / 1.3,
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
                                      longeur / 2,
                                      largeur / 1.3,
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
                                        longeur / 2,
                                        largeur / 1.3,
                                        "Finance",
                                        Icons.attach_money,
                                        Colors.green,
                                        choix[3]))
                              ],
                            ),
                          ],
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                GroupeService.create(Groupe(
                                        titre: _nomController.text,
                                        description: _descController.text,
                                        nbrMembre: 1,
                                        nbrMembreTotal:
                                            int.parse(_totalController.text),
                                        categorie: "Psychologie",
                                        frequenceMeet:
                                            int.parse(_freqMeetController.text),
                                        frequenceObj:
                                            int.parse(_freqObjController.text)))
                                    .then((_) {
                                  setState(() {
                                    load = false;
                                  });
                                  Navigator.pop(context);
                                });
                              }
                            },
                            child: const Text("Créer le groupe"))
                      ]),
                ),
              ),
      ),
    );
  }
}
