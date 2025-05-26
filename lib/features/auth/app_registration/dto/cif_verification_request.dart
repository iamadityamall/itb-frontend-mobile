class CifVerificationRequest {
  final String cifNumber;
  final String catchPhrase;
  final String imei;
  final String deviceModel;
  final String mobileNumber;

  CifVerificationRequest({
    required this.cifNumber,
    required this.catchPhrase,
    required this.imei,
    required this.deviceModel,
    required this.mobileNumber,
  });

  Map<String, dynamic> toJson() => {
    "cifNumber": cifNumber,
    "catchPhrase": catchPhrase,
    "imei": imei,
    "deviceModel": deviceModel,
    "mobileNumber": mobileNumber,
  };
}
