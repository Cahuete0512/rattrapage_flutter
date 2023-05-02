class Elixir {
  final String id;
  final String name;

  Elixir({
    required this.id,
    required this.name,
  });

  factory Elixir.fromJson(Map<String, dynamic> json) {
    return Elixir(
      id: json['id'],
      name: json['name'],
    );
  }
}