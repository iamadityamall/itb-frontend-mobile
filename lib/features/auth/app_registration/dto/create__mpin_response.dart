class CreateMpinResponse {
  final String status;
  final String message;
  final dynamic payload; // nullable, since in your example it's null
  final String timeStamp;

  CreateMpinResponse({
    required this.status,
    required this.message,
    this.payload,
    required this.timeStamp,
  });

  factory CreateMpinResponse.fromJson(Map<String, dynamic> json) {
    return CreateMpinResponse(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      payload: json['payload'], // keep dynamic
      timeStamp: json['timeStamp'] ?? '',
    );
  }
}
