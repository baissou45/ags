// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class User {
  String nom;
  String prenom;
  String mail;
  List<String> centreInteret;

  User({
    required this.nom,
    required this.prenom,
    required this.mail,
    required this.centreInteret,
  });

  User copyWith({
    String? nom,
    String? prenom,
    String? mail,
    List<String>? centreInteret,
  }) {
    return User(
      nom: nom ?? this.nom,
      prenom: prenom ?? this.prenom,
      mail: mail ?? this.mail,
      centreInteret: centreInteret ?? this.centreInteret,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nom': nom,
      'prenom': prenom,
      'mail': mail,
      'centreInteret': centreInteret,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        nom: map['nom'] as String,
        prenom: map['prenom'] as String,
        mail: map['mail'] as String,
        centreInteret: List<String>.from(
          (map['centreInteret'] as List<String>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(nom: $nom, prenom: $prenom, mail: $mail, centreInteret: $centreInteret)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.nom == nom &&
        other.prenom == prenom &&
        other.mail == mail &&
        listEquals(other.centreInteret, centreInteret);
  }

  @override
  int get hashCode {
    return nom.hashCode ^
        prenom.hashCode ^
        mail.hashCode ^
        centreInteret.hashCode;
  }
}
