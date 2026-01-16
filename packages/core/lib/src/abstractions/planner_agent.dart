import '../models/dependency_graph.dart';
import '../models/implementation_plan.dart';

/// The Planner Agent analyzes codebases and creates implementation strategies.
abstract class PlannerAgent {
  /// Analyzes the entire codebase and returns a dependency graph
  Future<DependencyGraph> analyzeCodebase(String projectPath);
  
  /// Generates an implementation plan from a feature request
  Future<ImplementationPlan> createPlan({
    required String featureRequest,
    required DependencyGraph currentState,
    // RepoBrain context would be passed here
  });
  
  /// Validates that a proposed change won't break existing functionality
  Future<RiskAssessment> assessRisk(ImplementationPlan plan);
}

class RiskAssessment {
  final bool approved;
  final List<String> concerns;
  final double riskScore; // 0.0 to 1.0

  RiskAssessment({
    required this.approved,
    required this.concerns,
    required this.riskScore,
  });
}
