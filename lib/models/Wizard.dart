import 'Elixir.dart';

class Wizard {
  final String id;
  final String? firstName;
  final String lastName;
  final List<Elixir> elixirs;

  Wizard({
    required this.id,
    this.firstName,
    required this.lastName,
    required this.elixirs,
  });

  factory Wizard.fromJson(Map<String, dynamic> json) {
    final elixirsData = json['elixirs'] as List<dynamic>;
    final elixirs = elixirsData.map((data) => Elixir.fromJson(data)).toList();

    return Wizard(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      elixirs: elixirs,
    );
  }
}


