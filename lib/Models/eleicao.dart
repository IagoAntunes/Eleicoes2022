import 'candidatos.dart';

class Eleicao {
  String? ele;
  String? pvv;
  List<Candidato>? cand;

  Eleicao({this.ele, this.cand, this.pvv});

  factory Eleicao.fromMap(Map<String, dynamic> map) {
    return Eleicao(
      ele: map['ele'] as String,
      pvv: map['pvv'] as String,
      cand: map['cand'],
    );
  }
}
