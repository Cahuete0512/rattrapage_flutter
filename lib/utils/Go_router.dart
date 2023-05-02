import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../pages/Wizard_detail_page.dart';
import '../pages/Wizard_list_page.dart';

class GoRouterWrapper {
  static GoRouter createRouter() {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => MaterialPage(child: WizardListPage()),
        ),
        GoRoute(
          path: '/detail/:wizardId',
          pageBuilder: (context, state) {
            final wizardId = state.params['wizardId'];
            return MaterialPage(child: WizardDetailPage(wizardId: wizardId!));
          },
        ),
      ],
    );
  }
}
