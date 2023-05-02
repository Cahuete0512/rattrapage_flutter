import 'package:flutter/material.dart';
import '../models/Wizard.dart';
import '../services/Wizard_service.dart';

class WizardDetailPage extends StatefulWidget {
  final String wizardId;

  WizardDetailPage({required this.wizardId});

  @override
  _WizardDetailPageState createState() => _WizardDetailPageState();
}

class _WizardDetailPageState extends State<WizardDetailPage> {
  late Future<Wizard> _wizardFuture;

  @override
  void initState() {
    super.initState();
    _wizardFuture = WizardService.fetchWizardById(widget.wizardId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wizard Details'),
      ),
      body: FutureBuilder<Wizard>(
        future: _wizardFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final wizard = snapshot.data!;
            return ListView.builder(
              itemCount: wizard.elixirs.length,
              itemBuilder: (context, index) {
                final elixir = wizard.elixirs[index];
                return ListTile(
                  title: Text(elixir.name),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Failed to fetch wizard details'),
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
