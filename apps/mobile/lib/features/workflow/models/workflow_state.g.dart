// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workflow_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkflowStateImpl _$$WorkflowStateImplFromJson(Map<String, dynamic> json) =>
    _$WorkflowStateImpl(
      currentStep: (json['currentStep'] as num?)?.toInt() ?? 0,
      stepStatuses:
          (json['stepStatuses'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$StepStatusEnumMap, e))
              .toList() ??
          const [
            StepStatus.active,
            StepStatus.locked,
            StepStatus.locked,
            StepStatus.locked,
            StepStatus.locked,
            StepStatus.locked,
            StepStatus.locked,
          ],
      projectId: json['projectId'] as String?,
    );

Map<String, dynamic> _$$WorkflowStateImplToJson(_$WorkflowStateImpl instance) =>
    <String, dynamic>{
      'currentStep': instance.currentStep,
      'stepStatuses': instance.stepStatuses
          .map((e) => _$StepStatusEnumMap[e]!)
          .toList(),
      'projectId': instance.projectId,
    };

const _$StepStatusEnumMap = {
  StepStatus.locked: 'locked',
  StepStatus.active: 'active',
  StepStatus.completed: 'completed',
  StepStatus.skipped: 'skipped',
};
