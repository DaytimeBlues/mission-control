import 'package:freezed_annotation/freezed_annotation.dart';

part 'workflow_state.freezed.dart';
part 'workflow_state.g.dart';

@freezed
class WorkflowState with _$WorkflowState {
  const factory WorkflowState({
    @Default(0) int currentStep,
    @Default([
      StepStatus.active,     // Step 0: Ideation
      StepStatus.locked,     // Step 1: Architecture
      StepStatus.locked,     // Step 2: Design
      StepStatus.locked,     // Step 3: Implementation
      StepStatus.locked,     // Step 4: Testing
      StepStatus.locked,     // Step 5: Deployment
      StepStatus.locked,     // Step 6: Maintenance
    ]) List<StepStatus> stepStatuses,
    String? projectId,
  }) = _WorkflowState;

  factory WorkflowState.fromJson(Map<String, dynamic> json) =>
      _$WorkflowStateFromJson(json);
}

enum StepStatus {
  locked,    // Cannot be accessed yet
  active,    // Currently working on this step
  completed, // Step is done
  skipped,   // Step was intentionally skipped
}
