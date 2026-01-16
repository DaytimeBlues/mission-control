/// Result of a test suite execution
class TestSuiteResult {
  final bool success;
  final int totalTests;
  final int passedTests;
  final int failedTests;
  final List<TestCaseResult> failures;

  TestSuiteResult({
    required this.success,
    required this.totalTests,
    required this.passedTests,
    required this.failedTests,
    required this.failures,
  });
}

class TestCaseResult {
  final String testName;
  final String? errorMessage;
  final String? stackTrace;
  final Duration duration;

  TestCaseResult({
    required this.testName,
    this.errorMessage,
    this.stackTrace,
    required this.duration,
  });
}

/// Result of E2E testing
class E2ETestResult {
  final bool success;
  final String scenarioName;
  final List<StepResult> steps;
  final List<VisualArtifact> artifacts;

  E2ETestResult({
    required this.success,
    required this.scenarioName,
    required this.steps,
    required this.artifacts,
  });
}

class StepResult {
  final String stepDescription;
  final bool success;
  final Duration duration;

  StepResult({required this.stepDescription, required this.success, required this.duration});
}

class VisualArtifact {
  final String path;
  final String description;
  final VisualCaptureType type;

  VisualArtifact({required this.path, required this.description, required this.type});
}

enum VisualCaptureType {
  screenshot,
  recording,
  log,
}
