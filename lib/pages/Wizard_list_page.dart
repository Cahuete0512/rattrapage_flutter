import 'package:flutter/material.dart';
import 'package:contant_magalie_b3/services/Wizard_service.dart';
import '../models/Wizard.dart';

class WizardListPage extends StatefulWidget {
  const WizardListPage({super.key});

  @override
  _WizardListPageState createState() => _WizardListPageState();
}

class _WizardListPageState extends State<WizardListPage> {
  late Future<List<Wizard>> _wizardListFuture;

  @override
  void initState() {
    super.initState();
    _wizardListFuture = WizardService.fetchWizards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List des Wizards'),
      ),
      body: FutureBuilder<List<Wizard>>(
        future: _wizardListFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final wizards = snapshot.data!;
            return ListView.builder(
              itemCount: wizards.length,
              itemBuilder: (context, index) {
                final wizard = wizards[index];
                return Card(
                  child: ListTile(
                    title: Text(wizard.lastName),
                    subtitle: Text(wizard.firstName ?? ''),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/detail',
                        arguments: wizard.id,
                      );
                    },
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Failed to fetch wizards'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
