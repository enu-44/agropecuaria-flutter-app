class ApiResponse<T> {
  final T data;
  final String message;
  final int code;
  final bool success;

  ApiResponse({
    required this.data,
    required this.message,
    required this.code,
    required this.success,
  });
}