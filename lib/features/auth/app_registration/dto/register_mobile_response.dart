class RegisterMobileResponse {
  final String message;
  final String messageCode;

  RegisterMobileResponse({
    required this.message,
    required this.messageCode,
  });

  factory RegisterMobileResponse.fromJson(Map<String, dynamic> json) {
    return RegisterMobileResponse(
      message: json['message'] ?? '',
      messageCode: json['messageCode'] ?? '',
    );
  }
}
