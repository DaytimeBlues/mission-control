import 'package:flutter/material.dart';
import '../models/workflow_state.dart';

/// Displays a horizontal progress indicator showing the 7 workflow steps
class StepIndicator extends StatelessWidget {
  final int currentStep;
  final List<StepStatus> stepStatuses;
  final ValueChanged<int>? onStepTapped;

  const StepIndicator({
    super.key,
    required this.currentStep,
    required this.stepStatuses,
    this.onStepTapped,
  });

  static const _stepLabels = [
    'Ideation',
    'Architecture',
    'Design',
    'Implementation',
    'Testing',
    'Deployment',
    'Maintenance',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemCount: 7,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final status = stepStatuses[index];
          final isCurrent = index == currentStep;

          return _StepItem(
            label: _stepLabels[index],
            stepNumber: index + 1,
            status: status,
            isCurrent: isCurrent,
            onTap: onStepTapped != null ? () => onStepTapped!(index) : null,
          );
        },
      ),
    );
  }
}

class _StepItem extends StatelessWidget {
  final String label;
  final int stepNumber;
  final StepStatus status;
  final bool isCurrent;
  final VoidCallback? onTap;

  const _StepItem({
    required this.label,
    required this.stepNumber,
    required this.status,
    required this.isCurrent,
    this.onTap,
  });

  Color _getColor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    switch (status) {
      case StepStatus.completed:
        return colorScheme.primary;
      case StepStatus.active:
        return colorScheme.primary;
      case StepStatus.skipped:
        return colorScheme.secondary;
      case StepStatus.locked:
        return colorScheme.surfaceContainerHighest;
    }
  }

  IconData _getIcon() {
    switch (status) {
      case StepStatus.completed:
        return Icons.check_circle;
      case StepStatus.active:
        return Icons.circle;
      case StepStatus.skipped:
        return Icons.skip_next;
      case StepStatus.locked:
        return Icons.lock;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getColor(context);
    final isInteractive = status != StepStatus.locked;

    return GestureDetector(
      onTap: isInteractive ? onTap : null,
      child: Opacity(
        opacity: status == StepStatus.locked ? 0.5 : 1.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: isCurrent ? 48 : 40,
              height: isCurrent ? 48 : 40,
              decoration: BoxDecoration(
                color: isCurrent ? color : color.withOpacity(0.2),
                shape: BoxShape.circle,
                border: isCurrent
                    ? Border.all(color: color, width: 3)
                    : null,
              ),
              child: Icon(
                _getIcon(),
                color: isCurrent
                    ? Theme.of(context).colorScheme.onPrimary
                    : color,
                size: isCurrent ? 24 : 20,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                    color: isCurrent ? color : null,
                  ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
