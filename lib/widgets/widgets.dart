import 'package:ags/models/user.dart';
import 'package:ags/widgets/custom_pageRoute.dart';
import 'package:flutter/material.dart';

class Widgets {
  static snackBar(String message, var context,
      {Color? color = Colors.red, int duree = 2}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: duree),
        backgroundColor: color,
        content: Text(
          message,
          textAlign: TextAlign.center,
        )));
  }

  static dialoge(context, page, titre) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14.0),
                bottomRight: Radius.circular(14.0))),
        title: Text(
          titre,
          textAlign: TextAlign.center,
        ),
        content: page,
        // contentPadding: EdgeInsets.zero,
      ),
    );
  }

  static navigate(context, page) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) => page));
  }

  static fullNavigate(context, page) {
    Navigator.pushAndRemoveUntil(
        context, CustomPageRoute(page), (Route<dynamic> route) => false);
  }

  static categorie_card(double longeur, double largeur, String titre,
      IconData icon, Color color, bool selected) {
    return Card(
      color: selected ? Colors.grey[300] : Colors.white,
      elevation: 5.0,
      child: SizedBox(
        width: largeur / 3,
        height: longeur / 6,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            icon,
            size: largeur / 10.0,
            color: color,
          ),
          SizedBox(height: longeur / 50.0),
          Text(
            titre,
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
        ]),
      ),
    );
  }

  static accueil_card(longeur, largeur, titre, nbr, IconData icon) {
    return Card(
      child: SizedBox(
        height: longeur / 8,
        width: largeur / 2.3,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(icon, color: Colors.grey[400], size: largeur / 10),
          Text(
            titre,
            textAlign: TextAlign.center,
            // style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: longeur / 90.0),
          Text(
            nbr.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ]),
      ),
    );
  }

  static userCard(longeur, largeur, User ami) {
    return Card(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: longeur / 150.0),
        margin: EdgeInsets.symmetric(vertical: longeur / 90.0),
        child: ListTile(
          leading: Image.asset("assets/avatar.png"),
          title: Text("${ami.nom} ${ami.prenom}"),
          subtitle:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(ami.mail),
            SizedBox(height: longeur / 150.0),
            Text(ami.centreInteret.toString())
          ]),
        ),
      ),
    );
  }
}
