class CreateMpinRequest {
  final String cifNumber;
  final String mpin;

  CreateMpinRequest({
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
