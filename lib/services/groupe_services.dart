import 'package:ags/models/groupe.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GroupeService {
  static create(Groupe groupe) async {
    await FirebaseFirestore.instance
        .collection("groupes")
        .doc("${groupe.titre}_${DateTime.now().microsecond}")
        .set(groupe.toMap());
  }
}
