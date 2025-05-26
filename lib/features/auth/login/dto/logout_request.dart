class LogoutRequest {
  final String cifNumber;
  final String mpin;

  LogoutRequest({
    required this.cifNumber,
    required this.mpin,
  });

  Map<String, dynamic> toJson() {
    return {
      'cifNumber': cifNumber,
      'mpin': mpin,
    };
  }
}
