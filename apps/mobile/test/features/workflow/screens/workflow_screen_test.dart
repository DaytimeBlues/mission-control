import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mission_control_mobile/features/workflow/screens/workflow_screen.dart';

void main() {
  group('WorkflowScreen', () {
    testWidgets('renders with StepIndicator and navigation buttons', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: WorkflowScreen(),
          ),
        ),
      );

      // Should show step indicator labels
      expect(find.text('Ideation'), findsOneWidget);
      
      // Should show current step title in AppBar
      expect(find.widgetWithText(AppBar, 'Feature Ideation'), findsOneWidget);
      
      // Should show Continue button
      expect(find.text('Continue'), findsOneWidget);
      
      // Should NOT show Back button on first step
      expect(find.text('Back'), findsNothing);
    });

    testWidgets('shows Back button after advancing to step 2', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: WorkflowScreen(),
          ),
        ),
      );

      // Tap Continue to advance
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      // Now Back button should appear
      expect(find.text('Back'), findsOneWidget);
      
      // AppBar title should update
      expect(find.widgetWithText(AppBar, 'Architecture Decision'), findsOneWidget);
    });

    testWidgets('shows Skip button for early steps', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: WorkflowScreen(),
          ),
        ),
      );

      // Skip button should be visible for steps 0-2
      expect(find.text('Skip'), findsOneWidget);
    });

    testWidgets('navigates back when Back button is tapped', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: WorkflowScreen(),
          ),
        ),
      );

      // Advance to step 2
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();
      
      // Tap Back
      await tester.tap(find.text('Back'));
      await tester.pumpAndSettle();

      // Should be back at step 1 in AppBar
      expect(find.widgetWithText(AppBar, 'Feature Ideation'), findsOneWidget);
    });

    testWidgets('shows Complete button on last step', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: WorkflowScreen(),
          ),
        ),
      );

      // Advance to final step (step 6)
      for (int i = 0; i < 6; i++) {
        await tester.tap(find.text('Continue'));
        await tester.pumpAndSettle();
      }

      // Should show Complete button instead of Continue
      expect(find.text('Complete'), findsOneWidget);
      expect(find.text('Continue'), findsNothing);
    });
  });
}
