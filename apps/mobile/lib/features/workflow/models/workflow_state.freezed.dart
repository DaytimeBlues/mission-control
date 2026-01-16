// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workflow_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WorkflowState _$WorkflowStateFromJson(Map<String, dynamic> json) {
  return _WorkflowState.fromJson(json);
}

/// @nodoc
mixin _$WorkflowState {
  int get currentStep => throw _privateConstructorUsedError;
  List<StepStatus> get stepStatuses => throw _privateConstructorUsedError;
  String? get projectId => throw _privateConstructorUsedError;

  /// Serializes this WorkflowState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkflowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkflowStateCopyWith<WorkflowState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkflowStateCopyWith<$Res> {
  factory $WorkflowStateCopyWith(
    WorkflowState value,
    $Res Function(WorkflowState) then,
  ) = _$WorkflowStateCopyWithImpl<$Res, WorkflowState>;
  @useResult
  $Res call({
    int currentStep,
    List<StepStatus> stepStatuses,
    String? projectId,
  });
}

/// @nodoc
class _$WorkflowStateCopyWithImpl<$Res, $Val extends WorkflowState>
    implements $WorkflowStateCopyWith<$Res> {
  _$WorkflowStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkflowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? stepStatuses = null,
    Object? projectId = freezed,
  }) {
    return _then(
      _value.copyWith(
            currentStep: null == currentStep
                ? _value.currentStep
                : currentStep // ignore: cast_nullable_to_non_nullable
                      as int,
            stepStatuses: null == stepStatuses
                ? _value.stepStatuses
                : stepStatuses // ignore: cast_nullable_to_non_nullable
                      as List<StepStatus>,
            projectId: freezed == projectId
                ? _value.projectId
                : projectId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkflowStateImplCopyWith<$Res>
    implements $WorkflowStateCopyWith<$Res> {
  factory _$$WorkflowStateImplCopyWith(
    _$WorkflowStateImpl value,
    $Res Function(_$WorkflowStateImpl) then,
  ) = __$$WorkflowStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int currentStep,
    List<StepStatus> stepStatuses,
    String? projectId,
  });
}

/// @nodoc
class __$$WorkflowStateImplCopyWithImpl<$Res>
    extends _$WorkflowStateCopyWithImpl<$Res, _$WorkflowStateImpl>
    implements _$$WorkflowStateImplCopyWith<$Res> {
  __$$WorkflowStateImplCopyWithImpl(
    _$WorkflowStateImpl _value,
    $Res Function(_$WorkflowStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkflowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? stepStatuses = null,
    Object? projectId = freezed,
  }) {
    return _then(
      _$WorkflowStateImpl(
        currentStep: null == currentStep
            ? _value.currentStep
            : currentStep // ignore: cast_nullable_to_non_nullable
                  as int,
        stepStatuses: null == stepStatuses
            ? _value._stepStatuses
            : stepStatuses // ignore: cast_nullable_to_non_nullable
                  as List<StepStatus>,
        projectId: freezed == projectId
            ? _value.projectId
            : projectId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkflowStateImpl implements _WorkflowState {
  const _$WorkflowStateImpl({
    this.currentStep = 0,
    final List<StepStatus> stepStatuses = const [
      StepStatus.active,
      StepStatus.locked,
      StepStatus.locked,
      StepStatus.locked,
      StepStatus.locked,
      StepStatus.locked,
      StepStatus.locked,
    ],
    this.projectId,
  }) : _stepStatuses = stepStatuses;

  factory _$WorkflowStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkflowStateImplFromJson(json);

  @override
  @JsonKey()
  final int currentStep;
  final List<StepStatus> _stepStatuses;
  @override
  @JsonKey()
  List<StepStatus> get stepStatuses {
    if (_stepStatuses is EqualUnmodifiableListView) return _stepStatuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stepStatuses);
  }

  @override
  final String? projectId;

  @override
  String toString() {
    return 'WorkflowState(currentStep: $currentStep, stepStatuses: $stepStatuses, projectId: $projectId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkflowStateImpl &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            const DeepCollectionEquality().equals(
              other._stepStatuses,
              _stepStatuses,
            ) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    currentStep,
    const DeepCollectionEquality().hash(_stepStatuses),
    projectId,
  );

  /// Create a copy of WorkflowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkflowStateImplCopyWith<_$WorkflowStateImpl> get copyWith =>
      __$$WorkflowStateImplCopyWithImpl<_$WorkflowStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkflowStateImplToJson(this);
  }
}

abstract class _WorkflowState implements WorkflowState {
  const factory _WorkflowState({
    final int currentStep,
    final List<StepStatus> stepStatuses,
    final String? projectId,
  }) = _$WorkflowStateImpl;

  factory _WorkflowState.fromJson(Map<String, dynamic> json) =
      _$WorkflowStateImpl.fromJson;

  @override
  int get currentStep;
  @override
  List<StepStatus> get stepStatuses;
  @override
  String? get projectId;

  /// Create a copy of WorkflowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkflowStateImplCopyWith<_$WorkflowStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
