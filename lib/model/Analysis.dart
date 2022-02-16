import 'dart:ffi';

class Analyis {
  final String espessura;
  final double nota_agregada;
  final double media_ponderada;
  final String observacao;

  Analyis({
    required this.espessura,
    required this.nota_agregada,
    required this.media_ponderada,
    required this.observacao,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "espessura": espessura,
      "nota_agreagada": nota_agregada,
      "media_ponderada": media_ponderada,
      "observacao": observacao,
    };
  }
}
