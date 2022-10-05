import 'package:appeleicoes/Models/candidatos.dart';
import 'package:flutter/material.dart';

class CandidatosProvider extends ChangeNotifier {
  List<Candidato> listCandidatos = [];

  setEquipe(List<Candidato> listCandidatos) {
    this.listCandidatos = listCandidatos;
  }

  List<Candidato> getCandidatos() {
    return listCandidatos;
  }
}
