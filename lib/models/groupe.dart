// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Groupe {
  String titre;
  String description;
  int nbrMembre;
  int nbrMembreTotal;
  int? frequenceMeet;
  int? frequenceObj;
  String categorie;

  Groupe({
    required this.titre,
    required this.description,
    required this.nbrMembre,
    required this.nbrMembreTotal,
    this.frequenceMeet,
    this.frequenceObj,
    required this.categorie,
  });

  Groupe copyWith({
    String? titre,
    String? description,
    int? nbrMembre,
    int? nbrMembreTotal,
    int? frequenceMeet,
    int? frequenceObj,
    String? categorie,
  }) {
    return Groupe(
      titre: titre ?? this.titre,
      description: description ?? this.description,
      nbrMembre: nbrMembre ?? this.nbrMembre,
      nbrMembreTotal: nbrMembreTotal ?? this.nbrMembreTotal,
      frequenceMeet: frequenceMeet ?? this.frequenceMeet,
      frequenceObj: frequenceObj ?? this.frequenceObj,
      categorie: categorie ?? this.categorie,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'titre': titre,
      'description': description,
      'nbrMembre': nbrMembre,
      'nbrMembreTotal': nbrMembreTotal,
      'frequenceMeet': frequenceMeet,
      'frequenceObj': frequenceObj,
      'categorie': categorie,
    };
  }

  factory Groupe.fromMap(Map<String, dynamic> map) {
    return Groupe(
      titre: map['titre'] as String,
      description: map['description'] as String,
      nbrMembre: map['nbrMembre'] as int,
      nbrMembreTotal: map['nbrMembreTotal'] as int,
      frequenceMeet:
          map['frequenceMeet'] != null ? map['frequenceMeet'] as int : null,
      frequenceObj:
          map['frequenceObj'] != null ? map['frequenceObj'] as int : null,
      categorie: map['categorie'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Groupe.fromJson(String source) =>
      Groupe.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Groupe(titre: $titre, description: $description, nbrMembre: $nbrMembre, nbrMembreTotal: $nbrMembreTotal, frequenceMeet: $frequenceMeet, frequenceObj: $frequenceObj, categorie: $categorie)';
  }

  @override
  bool operator ==(covariant Groupe other) {
    if (identical(this, other)) return true;

    return other.titre == titre &&
        other.description == description &&
        other.nbrMembre == nbrMembre &&
        other.nbrMembreTotal == nbrMembreTotal &&
        other.frequenceMeet == frequenceMeet &&
        other.frequenceObj == frequenceObj &&
        other.categorie == categorie;
  }

  @override
  int get hashCode {
    return titre.hashCode ^
        description.hashCode ^
        nbrMembre.hashCode ^
        nbrMembreTotal.hashCode ^
        frequenceMeet.hashCode ^
        frequenceObj.hashCode ^
        categorie.hashCode;
  }

  Map<String, dynamic> getInfo() {
    switch (categorie.toLowerCase()) {
      case "coprs":
        return {
          "color": Colors.brown,
          "icon": Icons.psychology,
        };
      case "psychologie":
        return {
          "color": Colors.deepPurple,
          "icon": Icons.psychology,
        };

      case "amour":
        return {
          "icon": CupertinoIcons.heart_fill,
          "color": Colors.red,
        };
      case "finance":
        return {
          "icon": Icons.attach_money,
          "color": Colors.green,
        };
      default:
        return {
          "color": null,
          "icon": null,
        };
    }
  }
}
