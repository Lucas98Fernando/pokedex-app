class Pokemon {
  final int id;
  final String name;
  final String num;
  final List<String> type;
  final String height;
  final String weight;
  final List<String> weaknesses;

  factory Pokemon.fromMap(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'] ?? '',
      num: json['num'],
      type: (json['type'] as List<dynamic>).map((e) => e as String).toList(),
      height: json['height'],
      weight: json['weight'],
      weaknesses: (json['weaknesses'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );
  }

  String get img =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/$id.svg';

  Pokemon({
    required this.id,
    required this.name,
    required this.num,
    required this.type,
    required this.height,
    required this.weight,
    required this.weaknesses,
  });
}
