class ApiError implements Exception {
  final String errorCode;
  final String detail;

  ApiError(this.errorCode, this.detail);

  @override
  String toString() => '$errorCode: $detail';
}
