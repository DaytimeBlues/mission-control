/// Represents the structural analysis of a codebase
class DependencyGraph {
  final List<FileNode> files;
  final List<DependencyEdge> edges;
  final Map<String, List<String>> importMap;
  final Map<String, ComponentType> componentTypes;

  DependencyGraph({
    required this.files,
    required this.edges,
    required this.importMap,
    required this.componentTypes,
  });
  
  /// Files that are foundational and affect many others
  List<FileNode> get criticalPaths => 
    files.where((f) => edges.where((e) => e.to == f.path).length > 5).toList();
}

class FileNode {
  final String path;
  final String content;
  final int lineCount;
  final List<String> exports;
  final List<String> imports;
  final ComponentType type;

  FileNode({
    required this.path,
    required this.content,
    required this.lineCount,
    required this.exports,
    required this.imports,
    required this.type,
  });
}

class DependencyEdge {
  final String from; // path
  final String to; // path
  final DependencyType type;

  DependencyEdge(this.from, this.to, this.type);
}

enum DependencyType {
  import,
  export,
  part,
  inheritance,
}

enum ComponentType {
  model,
  view,
  controller,
  service,
  utility,
  test,
  configuration,
  unknown,
}
