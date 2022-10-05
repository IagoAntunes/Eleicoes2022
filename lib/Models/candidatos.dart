import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class Candidato {
  String? seq;
  String? sqcand;
  String? n;
  String? nm;
  String? cc;
  String? nv;
  String? e;
  String? st;
  String? dvt;
  String? vap;
  String? pvap;
  Color? color;

  Candidato(
      {this.seq,
      this.sqcand,
      this.n,
      this.nm,
      this.cc,
      this.nv,
      this.e,
      this.st,
      this.dvt,
      this.vap,
      this.pvap,
      this.color});

  factory Candidato.fromMap(Map<String, dynamic> map) {
    Candidato candidato;
    candidato = Candidato(
      seq: map['seq'] as String,
      sqcand: map['sqcand'] as String,
      n: map['n'] as String,
      nm: map['nm'] as String,
      cc: map['cc'] as String,
      nv: map['nv'] as String,
      e: map['e'] as String,
      st: map['st'] as String,
      dvt: map['dvt'] as String,
      vap: map['vap'] as String,
      pvap: map['pvap'] as String,
    );

    if (candidato.n == '13') {
      candidato.color = Colors.red.shade600;
    } else if (candidato.n == '22') {
      candidato.color = Colors.green.shade600;
    } else if (candidato.n == '15') {
      candidato.color = Colors.blue.shade600;
    } else if (candidato.n == '12') {
      candidato.color = Colors.yellow.shade600;
    } else {
      candidato.color = Colors.orange.shade600;
    }

    return candidato;
  }
}
