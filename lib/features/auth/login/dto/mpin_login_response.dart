class MpinLoginResponse {
  final String jwt;
  final String userName;

  MpinLoginResponse({required this.jwt, required this.userName});

  factory MpinLoginResponse.fromJson(Map<String, dynamic> json) {
    return MpinLoginResponse(
      jwt: json['jwt'] ?? '',
      userName: json['userName'] ?? '',
    );
  }
}
