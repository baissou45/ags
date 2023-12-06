import 'package:ags/pages/auth/choix_categorie.dart';
import 'package:ags/pages/auth/login.dart';
import 'package:ags/pages/layout.dart';
import 'package:ags/services/auth_services.dart';
import 'package:ags/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  final _mailController = TextEditingController();
  final _passController = TextEditingController();
  final _passConfirmController = TextEditingController();

  bool not_show_pass = true;
  bool not_show_confirm_pass = true;

  @override
  Widget build(BuildContext context) {
    double longeur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;

    gap({size = 50.0}) {
      return SizedBox(height: longeur / size);
    }

    return Scaffold(
        body: Center(
      child: Card(
        elevation: 8.0,
        margin: EdgeInsets.symmetric(horizontal: largeur / 20.0),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: largeur / 20.0, vertical: longeur / 50.0),
          child: IntrinsicHeight(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    gap(size: 25),
                    Text(
                      "Inscription",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: largeur / 15),
                    ),
                    gap(),
                    TextFormField(
                      controller: _nomController,
                      validator: (value) {
                        if (_nomController.text.isEmpty) {
                          return "Ce champ est obligatoir";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person_outline),
                          label: Text("Nom")),
                    ),
                    gap(),
                    TextFormField(
                      controller: _prenomController,
                      validator: (value) {
                        if (_prenomController.text.isEmpty) {
                          return "Ce champ est obligatoir";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person_outline),
                          label: Text("Prénom")),
                    ),
                    gap(),
                    TextFormField(
                      controller: _mailController,
                      validator: (value) {
                        if (_mailController.text.isEmpty) {
                          return "Ce champ est obligatoir";
                        } else if (!_mailController.text.contains("@")) {
                          return "Veuillez entrer un mail valide";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.mail_outlined),
                          label: Text("Adresse mail")),
                    ),
                    gap(),
                    TextFormField(
                      controller: _passController,
                      obscureText: not_show_pass,
                      validator: (value) {
                        if (_passController.text.isEmpty) {
                          return "Ce champ est obligatoir";
                        } else if (_passConfirmController.text !=
                            _passController.text) {
                          return "Les mots de passe doivent etres identique";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock_outline_rounded),
                        label: Text("Mot de passe"),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              not_show_pass = !not_show_pass;
                            });
                          },
                          icon: Icon(not_show_pass
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                    ),
                    gap(),
                    TextFormField(
                      obscureText: not_show_confirm_pass,
                      controller: _passConfirmController,
                      validator: (value) {
                        if (_passConfirmController.text !=
                            _passController.text) {
                          return "Les mots de passe doivent etres identique";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock_outline_rounded),
                        label: Text("Confirmation mot de passe"),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              not_show_confirm_pass = !not_show_confirm_pass;
                            });
                          },
                          icon: Icon(not_show_confirm_pass
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                    ),
                    gap(size: 30),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        onPressed: () async {
                          // if (_formKey.currentState!.validate()) {
                          // await AuthServices.register(
                          //   _nomController.text,
                          //   _prenomController.text,
                          //   _mailController.text,
                          //   _passController.text,
                          // ).then((_) {
                          //   Widgets.fullNavigate(context, const Layout());
                          // });
                          Widgets.fullNavigate(context, const ChoixCategorie());
                          // }
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: largeur / 30.0),
                          child: const Text(
                            "Connexion",
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                    // gap(),
                    TextButton(
                        onPressed: () {
                          Widgets.fullNavigate(context, const Login());
                        },
                        child: const Text(
                          "Se connecter",
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
