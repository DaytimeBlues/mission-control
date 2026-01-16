import '../models/implementation_plan.dart';
import '../models/builder_results.dart';
import '../models/dependency_graph.dart';

/// The Builder Agent executes implementation plans by writing code.
abstract class BuilderAgent {
  /// Executes a single task from an implementation plan
  Future<TaskResult> executeTask({
    required ImplementationTask task,
    // Context needed
  });
  
  /// Runs a terminal command with safety checks
  Future<CommandResult> runCommand({
    required String command,
    required CommandRiskLevel riskLevel,
    bool requireHumanApproval = false,
  });
  
  /// Generates code for a specific file
  Future<CodeGenerationResult> generateCode({
    required String targetPath,
    required String specification,
    required DependencyGraph context,
  });
  
  /// Streams progress updates during execution
  Stream<String> get progressStream;
}

/// Risk levels for terminal commands
enum CommandRiskLevel {
  safe,       // npm install, flutter pub get
  moderate,   // file modifications, builds
  high,       // rm commands, deployments
  critical,   // production changes, data deletion
}
