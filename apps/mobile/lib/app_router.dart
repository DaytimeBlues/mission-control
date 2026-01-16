import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'features/shell/shell_screen.dart';
import 'features/dashboard/dashboard_screen.dart';
import 'features/workflow/screens/workflow_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/dashboard',
    routes: [
      // Workflow route (full screen, no bottom nav)
      GoRoute(
        path: '/workflow',
        builder: (context, state) => const WorkflowScreen(),
      ),
      
      // Main shell with bottom navigation
      ShellRoute(
        builder: (context, state, child) => ShellScreen(child: child),
        routes: [
          GoRoute(
            path: '/dashboard',
            builder: (context, state) => const DashboardScreen(),
          ),
          GoRoute(
            path: '/projects',
            builder: (context, state) => const PlaceholderScreen(title: 'Projects'),
          ),
          GoRoute(
            path: '/deployments',
            builder: (context, state) => const PlaceholderScreen(title: 'Deployments'),
          ),
          GoRoute(
            path: '/activity',
            builder: (context, state) => const PlaceholderScreen(title: 'Activity'),
          ),
        ],
      ),
    ],
  );
});

class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(title));
  }
}
