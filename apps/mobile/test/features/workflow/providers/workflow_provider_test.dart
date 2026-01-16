import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mission_control_mobile/features/workflow/models/workflow_state.dart';
import 'package:mission_control_mobile/features/workflow/providers/workflow_provider.dart';

void main() {
  group('WorkflowProvider', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('initial state is step 0', () {
      final state = container.read(workflowProvider);
      
      expect(state.currentStep, 0);
      expect(state.stepStatuses[0], StepStatus.active);
      for (int i = 1; i < 7; i++) {
        expect(state.stepStatuses[i], StepStatus.locked);
      }
    });

    test('nextStep() increments step and updates statuses', () {
      final notifier = container.read(workflowProvider.notifier);
      
      notifier.nextStep();
      
      final state = container.read(workflowProvider);
      expect(state.currentStep, 1);
      expect(state.stepStatuses[0], StepStatus.completed);
      expect(state.stepStatuses[1], StepStatus.active);
    });

    test('previousStep() decrements step and updates statuses', () {
      final notifier = container.read(workflowProvider.notifier);
      
      // Go to step 1 first
      notifier.nextStep();
      
      // Then go back
      notifier.previousStep();
      
      final state = container.read(workflowProvider);
      expect(state.currentStep, 0);
      expect(state.stepStatuses[0], StepStatus.active);
      expect(state.stepStatuses[1], StepStatus.locked);
    });

    test('cannot go past step 6', () {
      final notifier = container.read(workflowProvider.notifier);
      
      // Try to go to step 7 (should stop at 6)
      for (int i = 0; i < 10; i++) {
        notifier.nextStep();
      }
      
      final state = container.read(workflowProvider);
      expect(state.currentStep, 6);
    });

    test('cannot go below step 0', () {
      final notifier = container.read(workflowProvider.notifier);
      
      // Try to go below 0
      notifier.previousStep();
      notifier.previousStep();
      
      final state = container.read(workflowProvider);
      expect(state.currentStep, 0);
    });

    test('goToStep() jumps to unlocked step', () {
      final notifier = container.read(workflowProvider.notifier);
      
      // Complete step 0 to unlock step 1
      notifier.nextStep();
      
      // Now go back to step 0 (which is completed, so should be accessible)
      notifier.goToStep(0);
      
      final state = container.read(workflowProvider);
      expect(state.currentStep, 0);
      expect(state.stepStatuses[0], StepStatus.active);
    });

    test('goToStep() cannot jump to locked step', () {
      final notifier = container.read(workflowProvider.notifier);
      
      // Try to jump to step 3 (locked)
      notifier.goToStep(3);
      
      final state = container.read(workflowProvider);
      expect(state.currentStep, 0); // Should stay at 0
    });

    test('skipCurrentStep() marks step as skipped and moves forward', () {
      final notifier = container.read(workflowProvider.notifier);
      
      notifier.skipCurrentStep();
      
      final state = container.read(workflowProvider);
      expect(state.currentStep, 1);
      expect(state.stepStatuses[0], StepStatus.skipped);
      expect(state.stepStatuses[1], StepStatus.active);
    });

    test('setProjectId() sets the project ID', () {
      final notifier = container.read(workflowProvider.notifier);
      
      notifier.setProjectId('test-project-123');
      
      final state = container.read(workflowProvider);
      expect(state.projectId, 'test-project-123');
    });

    test('completeCurrentStep() is equivalent to nextStep()', () {
      final notifier = container.read(workflowProvider.notifier);
      
      notifier.completeCurrentStep();
      
      final state = container.read(workflowProvider);
      expect(state.currentStep, 1);
      expect(state.stepStatuses[0], StepStatus.completed);
    });
  });
}
