class Talhao {
  final int id;
  final String name;
  final double areaSessao;
  final int id_farm;

  Talhao(
      {required this.id,
      required this.name,
      required this.areaSessao,
      required this.id_farm});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "name": name,
      "areaSessao": areaSessao,
      "id_farm": id_farm
    };
  }

  factory Talhao.fromMap(Map<String, dynamic> json) => new Talhao(
        id: json["id"],
        name: json["name"],
        areaSessao: json['areaSessao'],
        id_farm: json['id_farm'],
      );
}
