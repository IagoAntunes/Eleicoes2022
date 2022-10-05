import 'candidatos.dart';

class Eleicao {
  String? ele;
  List<Candidato>? listaCandidatos;

  Eleicao({this.ele, this.listaCandidatos});

  factory Eleicao.fromMap(Map<String, dynamic> map) {
    return Eleicao(
      ele: map['ele'] as String,
    );
  }
}
