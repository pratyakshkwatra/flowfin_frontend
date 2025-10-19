class APIKey {
  final int id;
  final String name;
  final String key;
  final int totalCalls;
  final int totalErrors;
  final int totalSuccess;

  APIKey({
    required this.id,
    required this.name,
    required this.key,
    required this.totalCalls,
    required this.totalErrors,
    required this.totalSuccess,
  });

  factory APIKey.fromMap(Map<String, dynamic> map) {
    return APIKey(
      id: map['id'],
      name: map['name'],
      key: map['key'],
      totalCalls: map['total_calls'] ?? 0,
      totalErrors: map['total_errors'] ?? 0,
      totalSuccess: map['total_success'] ?? 0,
    );
  }
}
