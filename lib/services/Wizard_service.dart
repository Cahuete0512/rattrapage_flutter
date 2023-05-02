import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/Wizard.dart';

class WizardService {
  static Future<List<Wizard>> fetchWizards() async {
    final response = await http.get(Uri.parse('https://wizard-world-api.herokuapp.com/wizards'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as List<dynamic>;
      final wizards = jsonData.map((item) => Wizard.fromJson(item)).toList();
      return wizards;
    } else {
      throw Exception('Failed to fetch wizards');
    }
  }

  static Future<Wizard> fetchWizardById(String wizardId) async {
    final response = await http.get(Uri.parse('https://wizard-world-api.herokuapp.com/wizards/$wizardId'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
      final wizard = Wizard.fromJson(jsonData);
      return wizard;
    } else {
      throw Exception('Failed to fetch wizard');
    }
  }
}
