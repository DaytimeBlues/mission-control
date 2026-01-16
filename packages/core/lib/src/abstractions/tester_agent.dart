import '../models/tester_results.dart';
import '../models/implementation_plan.dart';

/// The Tester Agent performs automated testing and verification.
abstract class TesterAgent {
  /// Runs the complete test suite for a project
  Future<TestSuiteResult> runTestSuite({
    required String projectPath,
    TestSuiteConfig? config,
  });
  
  /// Performs E2E testing with browser automation
  Future<E2ETestResult> runE2ETests({
    required List<E2ETestCase> testCases,
    required BrowserConfig browserConfig,
  });
  
  /// Generates a QA Test Plan from specifications
  Future<QATestPlan> generateTestPlan({
    required String specification,
    required ImplementationPlan implementation,
  });
  
  /// Captures visual artifacts (screenshots, recordings)
  Future<VisualArtifact> captureVisual({
    required String url,
    required VisualCaptureType type,
  });
}

class TestSuiteConfig {
  final List<String> paths;
  final bool runUnitTests;
  final bool runIntegrationTests;

  TestSuiteConfig({
    required this.paths,
    this.runUnitTests = true,
    this.runIntegrationTests = false,
  });
}

class BrowserConfig {
  final bool headless;
  final String deviceType;

  BrowserConfig({this.headless = true, this.deviceType = 'desktop'});
}

class E2ETestCase {
  final String name;
  final List<String> steps;

  E2ETestCase({required this.name, required this.steps});
}

class QATestPlan {
  final String id;
  final List<E2ETestCase> cases;

  QATestPlan({required this.id, required this.cases});
}
