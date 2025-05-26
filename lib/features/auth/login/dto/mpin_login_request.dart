class MpinLoginRequest {
  final String cifNumber;
  final String mpin;

  MpinLoginRequest({required this.cifNumber, required this.mpin});

  Map<String, dynamic> toJson() {
    return {
      'cifNumber': cifNumber,
      'mpin': mpin,
    };
  }
}
