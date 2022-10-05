import 'dart:convert';

import 'package:appeleicoes/Models/eleicao.dart';
import 'package:http/http.dart' as http;

import '../Models/candidatos.dart';
import '../Providers/candidatos_provider.dart';

class Gerenciador {
  List<Candidato>? listaCandidatos = [];

  getApi() async {
    final response = await http.get(Uri.parse(
        'https://resultados.tse.jus.br/oficial/ele2022/544/dados-simplificados/br/br-c0001-e000544-r.json'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      for (var cand in data['cand']) {
        final map = {
          'seq': cand['seq'],
          'sqcand': cand['sqcand'].toString(),
          'n': cand['n'],
          'nm': cand['nm'],
          'cc': cand['cc'],
          'nv': cand['nv'],
          'e': cand['e'],
          'st': cand['st'],
          'dvt': cand['dvt'],
          'vap': cand['vap'],
          'pvap': cand['pvap'],
        };
        listaCandidatos!.add(Candidato.fromMap(map));
      }
    }
  }

  getCandidatos() {
    return listaCandidatos;
  }
}
