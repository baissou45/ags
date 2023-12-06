import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static login(email, pass) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pass);
  }

  static register(nom, prenom, email, pass) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((value) async => await FirebaseFirestore.instance
            .collection("users")
            .doc(email)
            .set({"nom": nom, "prenom": prenom, "email": email, "pass": pass}));
  }
}
