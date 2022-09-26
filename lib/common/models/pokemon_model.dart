class Pokemon {
  final int id;
  final String name;
  final String img;
  final String num;
  final List<String> type;

  factory Pokemon.fromMap(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'] ?? '',
      img: json['img'] ?? '',
      num: json['num'],
      type: (json['type'] as List<dynamic>).map((e) => e as String).toList(),
    );
  }

  Pokemon({
    required this.id,
    required this.name,
    required this.img,
    required this.num,
    required this.type,
  });
}
