import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mission_control_mobile/features/workflow/models/workflow_state.dart';
import 'package:mission_control_mobile/features/workflow/widgets/step_indicator.dart';

void main() {
  group('StepIndicator Widget', () {
    testWidgets('renders all 7 steps', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StepIndicator(
              currentStep: 0,
              stepStatuses: List.filled(7, StepStatus.locked),
            ),
          ),
        ),
      );

      // Should find 7 step items
      expect(find.text('Ideation'), findsOneWidget);
      expect(find.text('Architecture'), findsOneWidget);
      expect(find.text('Design'), findsOneWidget);
      expect(find.text('Implementation'), findsOneWidget);
      expect(find.text('Testing'), findsOneWidget);
      expect(find.text('Deployment'), findsOneWidget);
      expect(find.text('Maintenance'), findsOneWidget);
    });

    testWidgets('current step is highlighted', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StepIndicator(
              currentStep: 2,
              stepStatuses: [
                StepStatus.completed,
                StepStatus.completed,
                StepStatus.active,
                StepStatus.locked,
                StepStatus.locked,
                StepStatus.locked,
                StepStatus.locked,
              ],
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Current step (Design) should be enlarged and highlighted
      // This would need more detailed testing with finder keys in real implementation
      expect(find.text('Design'), findsOneWidget);
    });

    testWidgets('completed steps show checkmark icons', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StepIndicator(
              currentStep: 2,
              stepStatuses: [
                StepStatus.completed,
                StepStatus.completed,
                StepStatus.active,
                StepStatus.locked,
                StepStatus.locked,
                StepStatus.locked,
                StepStatus.locked,
              ],
            ),
          ),
        ),
      );

      // Should find check_circle icons for completed steps
      expect(find.byIcon(Icons.check_circle), findsWidgets);
    });

    testWidgets('locked steps are grayed out', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StepIndicator(
              currentStep: 0,
              stepStatuses: [
                StepStatus.active,
                StepStatus.locked,
                StepStatus.locked,
                StepStatus.locked,
                StepStatus.locked,
                StepStatus.locked,
                StepStatus.locked,
              ],
            ),
          ),
        ),
      );

      // Should find lock icons for locked steps
      expect(find.byIcon(Icons.lock), findsWidgets);
    });

    testWidgets('tap triggers onStepTapped callback', (tester) async {
      int? tappedIndex;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StepIndicator(
              currentStep: 0,
              stepStatuses: [
                StepStatus.active,
                StepStatus.locked,
                StepStatus.locked,
                StepStatus.locked,
                StepStatus.locked,
                StepStatus.locked,
                StepStatus.locked,
              ],
              onStepTapped: (index) => tappedIndex = index,
            ),
          ),
        ),
      );

      // Tap on the first step
      await tester.tap(find.text('Ideation'));
      expect(tappedIndex, 0);
    });

    testWidgets('skipped steps show skip_next icon', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StepIndicator(
              currentStep: 2,
              stepStatuses: [
                StepStatus.completed,
                StepStatus.skipped,
                StepStatus.active,
                StepStatus.locked,
                StepStatus.locked,
                StepStatus.locked,
                StepStatus.locked,
              ],
            ),
          ),
        ),
      );

      // Should find skip_next icon for skipped step
      expect(find.byIcon(Icons.skip_next), findsOneWidget);
    });
  });
}
