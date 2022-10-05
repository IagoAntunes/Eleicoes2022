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
      this.pvap});

  factory Candidato.fromMap(Map<String, dynamic> map) {
    return Candidato(
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
  }
}
