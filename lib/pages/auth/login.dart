import 'package:ags/pages/auth/register.dart';
import 'package:ags/pages/layout.dart';
import 'package:ags/services/auth_services.dart';
import 'package:ags/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _mailController = TextEditingController();
  final _passController = TextEditingController();

  bool not_show_pass = true;

  @override
  Widget build(BuildContext context) {
    double longeur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;

    gap({size = 40.0}) {
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
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  gap(size: 25),
                  Text(
                    "Connexion",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: largeur / 15),
                  ),
                  gap(size: 30),
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
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                        label: Text("E-Mail")),
                  ),
                  gap(),
                  TextFormField(
                    controller: _passController,
                    obscureText: not_show_pass,
                    validator: (value) {
                      if (_passController.text.isEmpty) {
                        return "Ce champ est obligatoir";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                      label: const Text("Mot de passe"),
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
                  gap(size: 30),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await AuthServices.login(
                                  _mailController.text, _passController.text)
                              .then((_) {
                            Widgets.fullNavigate(context, const Layout());
                          });
                        }
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
                        Widgets.fullNavigate(context, Register());
                      },
                      child: const Text(
                        "Créer un compte",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
