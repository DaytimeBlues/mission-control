import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/workflow_state.dart';

/// Provider for workflow state management
final workflowProvider = StateNotifierProvider<WorkflowNotifier, WorkflowState>((ref) {
  return WorkflowNotifier();
});

/// Manages the workflow state and navigation between steps
class WorkflowNotifier extends StateNotifier<WorkflowState> {
  WorkflowNotifier() : super(const WorkflowState());

  /// Moves to the next step if possible
  void nextStep() {
    if (state.currentStep < 6) {
      final newStatuses = List<StepStatus>.from(state.stepStatuses);
      
      // Mark current step as completed
      newStatuses[state.currentStep] = StepStatus.completed;
      
      // Unlock next step
      if (state.currentStep < 6) {
        newStatuses[state.currentStep + 1] = StepStatus.active;
      }
      
      state = state.copyWith(
        currentStep: state.currentStep + 1,
        stepStatuses: newStatuses,
      );
    }
  }

  /// Moves to the previous step if possible
  void previousStep() {
    if (state.currentStep > 0) {
      final newStatuses = List<StepStatus>.from(state.stepStatuses);
      
      // Mark current step as locked again
      newStatuses[state.currentStep] = StepStatus.locked;
      
      // Reactivate previous step
      newStatuses[state.currentStep - 1] = StepStatus.active;
      
      state = state.copyWith(
        currentStep: state.currentStep - 1,
        stepStatuses: newStatuses,
      );
    }
  }

  /// Jumps to a specific step if it's unlocked
  void goToStep(int step) {
    if (step >= 0 && step <= 6 && state.stepStatuses[step] != StepStatus.locked) {
      final newStatuses = List<StepStatus>.from(state.stepStatuses);
      
      // Deactivate current step  
      newStatuses[state.currentStep] = StepStatus.completed;
      
      // Activate target step
      newStatuses[step] = StepStatus.active;
      
      state = state.copyWith(
        currentStep: step,
        stepStatuses: newStatuses,
      );
    }
  }

  /// Marks the current step as completed and unlocks the next
  void completeCurrentStep() {
    nextStep();
  }

  /// Skips the current step
  void skipCurrentStep() {
    if (state.currentStep < 6) {
      final newStatuses = List<StepStatus>.from(state.stepStatuses);
      
      // Mark current as skipped
      newStatuses[state.currentStep] = StepStatus.skipped;
      
      // Unlock and activate next step
      if (state.currentStep < 6) {
        newStatuses[state.currentStep + 1] = StepStatus.active;
      }
      
      state = state.copyWith(
        currentStep: state.currentStep + 1,
        stepStatuses: newStatuses,
      );
    }
  }

  /// Sets the project ID
  void setProjectId(String id) {
    state = state.copyWith(projectId: id);
  }
}
