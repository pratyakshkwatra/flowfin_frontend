class APIAnalytics {
  final int totalCalls;
  final int totalErrors;
  final int totalSuccess;

  APIAnalytics({
    required this.totalCalls,
    required this.totalErrors,
    required this.totalSuccess,
  });

  factory APIAnalytics.fromMap(Map<String, dynamic> map) {
    return APIAnalytics(
      totalCalls: map['total_calls'] ?? 0,
      totalErrors: map['total_errors'] ?? 0,
      totalSuccess: map['total_success'] ?? 0,
    );
  }
}
