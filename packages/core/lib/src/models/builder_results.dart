/// Result of a single implementation task
class TaskResult {
  final bool success;
  final String message;
  final List<String> modifiedFiles;
  final ThoughtSignature signature;

  TaskResult({
    required this.success,
    required this.message,
    required this.modifiedFiles,
    required this.signature,
  });
}

/// Result of a terminal command execution
class CommandResult {
  final int exitCode;
  final String stdout;
  final String stderr;
  final bool approvedByUser;

  CommandResult({
    required this.exitCode,
    required this.stdout,
    required this.stderr,
    required this.approvedByUser,
  });
}

/// Result of AI code generation
class CodeGenerationResult {
  final String code;
  final String explanation;
  final List<String> imports;

  CodeGenerationResult({
    required this.code,
    required this.explanation,
    required this.imports,
  });
}

/// Encrypted reasoning state for transparency and audit
class ThoughtSignature {
  final String id;
  final DateTime timestamp;
  final String encryptedState; // Mock encryption for now
  final String previousSignatureHash;

  ThoughtSignature({
    required this.id,
    required this.timestamp,
    required this.encryptedState,
    required this.previousSignatureHash,
  });
}
