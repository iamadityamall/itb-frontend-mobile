class CifVerificationResponse {
  final String clientName;
  final String clientCode;
  final String jwt;
  final String message;
  final String cifNumber;
  final int? attemptsLeft; // added attemptsLeft

  CifVerificationResponse({
    required this.clientName,
    required this.clientCode,
    required this.jwt,
    required this.message,
    required this.cifNumber,
    this.attemptsLeft,
  });

  factory CifVerificationResponse.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Payload is null');
    }

    return CifVerificationResponse(
      clientName: json['clientName'] ?? '',
      clientCode: json['clientCode'] ?? '',
      jwt: json['jwt'] ?? '',
      message: json['message'] ?? '',
      cifNumber: json['cifNumber'] ?? '',
      attemptsLeft: json['attemptsLeft'] != null
          ? int.tryParse(json['attemptsLeft'].toString())
          : null,
    );
  }
}
