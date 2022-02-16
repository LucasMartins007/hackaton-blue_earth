class Farm {
  int id;
  final String name;
  final String state;
  final String city;
  final String latitude;
  final String longitude;

  Farm({
    required this.id,
    required this.name,
    required this.state,
    required this.city,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "name": name,
      "state": state,
      "city": city,
      "latitude": latitude,
      "longitude": longitude,
    };
  }

  factory Farm.fromMap(Map<String, dynamic> json) => new Farm(
      id: json["id"],
      name: json["name"],
      state: json['state'],
      city: json['city'],
      latitude: json['latitude'],
      longitude: json['longitude']);
}
