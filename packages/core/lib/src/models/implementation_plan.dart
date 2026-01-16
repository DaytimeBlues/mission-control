class ImplementationPlan {
  final String id;
  final String featureRequest;
  final String complexity;
  final int estimatedHours;
  final List<PlanPhase> phases;
  final List<Risk> risks;
  final List<String> breakingChanges;

  ImplementationPlan({
    required this.id,
    required this.featureRequest,
    required this.complexity,
    required this.estimatedHours,
    required this.phases,
    required this.risks,
    required this.breakingChanges,
  });
}

class PlanPhase {
  final String name;
  final int order;
  final List<ImplementationTask> tasks;

  PlanPhase({required this.name, required this.order, required this.tasks});
}

class ImplementationTask {
  final String file;
  final String action; // create, modify, delete
  final String description;
  final List<String> dependencies;

  ImplementationTask({
    required this.file,
    required this.action,
    required this.description,
    required this.dependencies,
  });
}

class Risk {
  final String level; // low, medium, high
  final String description;
  final String mitigation;

  Risk({required this.level, required this.description, required this.mitigation});
}
