class AuthResponse {
  final bool success;
  final String message;
  final dynamic data;
  final String? errorCode;

  AuthResponse({
    required this.success,
    required this.message,
    this.data,
    this.errorCode,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? 'Unknown error',
      data: json['data'],
      errorCode: json['errorCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data,
      'errorCode': errorCode,
    };
  }
}
