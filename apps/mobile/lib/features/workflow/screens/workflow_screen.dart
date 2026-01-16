import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/workflow_provider.dart';
import '../widgets/step_indicator.dart';

/// Main container screen for the 7-step workflow
class WorkflowScreen extends ConsumerWidget {
  const WorkflowScreen({super.key});

  static const _stepTitles = [
    'Feature Ideation',
    'Architecture Decision',
    'UI/UX Design',
    'Implementation',
    'Testing & QA',
    'Deployment',
    'Maintenance',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workflowState = ref.watch(workflowProvider);
    final notifier = ref.read(workflowProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(_stepTitles[workflowState.currentStep]),
        centerTitle: false,
        actions: [
          // Skip step button (only for certain steps)
          if (workflowState.currentStep < 3)
            TextButton(
              onPressed: () => notifier.skipCurrentStep(),
              child: const Text('Skip'),
            ),
        ],
      ),
      body: Column(
        children: [
          // Step indicator at top
          StepIndicator(
            currentStep: workflowState.currentStep,
            stepStatuses: workflowState.stepStatuses,
            onStepTapped: (step) => notifier.goToStep(step),
          ),
          const Divider(height: 1),
          
          // Step content area
          Expanded(
            child: _buildStepContent(workflowState.currentStep),
          ),
        ],
      ),
      
      // Navigation buttons at bottom
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Back button
              if (workflowState.currentStep > 0)
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => notifier.previousStep(),
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Back'),
                  ),
                ),
              if (workflowState.currentStep > 0)
                const SizedBox(width: 16),
              
              // Next/Complete button
              Expanded(
                flex: 2,
                child: FilledButton.icon(
                  onPressed: () => notifier.completeCurrentStep(),
                  icon: Icon(workflowState.currentStep < 6 
                      ? Icons.arrow_forward 
                      : Icons.check),
                  label: Text(workflowState.currentStep < 6 
                      ? 'Continue' 
                      : 'Complete'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepContent(int step) {
    switch (step) {
      case 0:
        return const _IdeationPlaceholder();
      case 1:
        return const _ArchitecturePlaceholder();
      case 2:
        return const _DesignPlaceholder();
      case 3:
        return const _ImplementationPlaceholder();
      case 4:
        return const _TestingPlaceholder();
      case 5:
        return const _DeploymentPlaceholder();
      case 6:
        return const _MaintenancePlaceholder();
      default:
        return const Center(child: Text('Unknown step'));
    }
  }
}

// Placeholder widgets for each step - will be replaced with actual implementations
class _IdeationPlaceholder extends StatelessWidget {
  const _IdeationPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.lightbulb_outline, size: 64, 
               color: Theme.of(context).colorScheme.primary),
          const SizedBox(height: 16),
          Text('Feature Ideation', 
               style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text('Chat with AI Product Manager to define your feature',
               style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class _ArchitecturePlaceholder extends StatelessWidget {
  const _ArchitecturePlaceholder();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Architecture Decision Tree'));
  }
}

class _DesignPlaceholder extends StatelessWidget {
  const _DesignPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('UI/UX Design'));
  }
}

class _ImplementationPlaceholder extends StatelessWidget {
  const _ImplementationPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Implementation'));
  }
}

class _TestingPlaceholder extends StatelessWidget {
  const _TestingPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Testing & QA'));
  }
}

class _DeploymentPlaceholder extends StatelessWidget {
  const _DeploymentPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Deployment'));
  }
}

class _MaintenancePlaceholder extends StatelessWidget {
  const _MaintenancePlaceholder();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Maintenance'));
  }
}
