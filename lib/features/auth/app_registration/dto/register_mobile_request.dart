class RegisterMobileRequest {
  final String cifNumber;
  final String imei;
  final String deviceModel;
  final String mobileNumber;
  final String userName;

  RegisterMobileRequest({
    required this.cifNumber,
    required this.imei,
    required this.deviceModel,
    required this.mobileNumber,
    required this.userName,
  });

  Map<String, dynamic> toJson() => {
    'cifNumber': cifNumber,
    'imei': imei,
    'deviceModel': deviceModel,
    'mobileNumber': mobileNumber,
    'userName': userName,
  };
}
