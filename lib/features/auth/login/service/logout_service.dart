import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../../core/constants/api_constants.dart';
import '../dto/logout_request.dart';
import '../dto/logout_response.dart';

class LogoutService {
  final Dio _dio = Dio();
  final _storage = const FlutterSecureStorage();

  Future<LogoutResponse?> logout(LogoutRequest request) async {
    final jwt = await _storage.read(key: 'jwt_token');

    final response = await _dio.post(
      ApiConstants.logout,  // Make sure this is defined in your ApiConstants
      data: request.toJson(),
      options: Options(
        headers: {'Authorization': 'Bearer $jwt'},
      ),
    );

    final data = response.data;

    if (response.statusCode == 200 && data['status'] == 'SUCCESS') {
      await _storage.write(key: 'jwt_token', value: "");
      return LogoutResponse.fromJson(data['payload']);
    } else {
      throw Exception(data['message'] ?? 'Unknown logout error');
    }
  }
}
