import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../dto/mpin_login_request.dart';
import '../dto/mpin_login_response.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/error/api_error.dart';

class MpinLoginService {
  final Dio _dio = Dio();
  final _storage = const FlutterSecureStorage();

  Future<MpinLoginResponse> loginMpin(MpinLoginRequest request) async {
    final response = await _dio.post(
      ApiConstants.loginMpin,
      data: request.toJson(),
      options: Options(
        validateStatus: (status) {
          // Accept all status codes below 500 to handle 4xx in-code
          return status != null && status < 500;
        },
      ),
    );

    final data = response.data;

    if (response.statusCode == 200 && data['status'] == 'SUCCESS') {
      final payload = data['payload'];
      await _storage.write(key: 'jwt_token', value: payload['jwt']);
      await _storage.write(key: 'user_name', value: payload['userName']);
      return MpinLoginResponse.fromJson(payload);
    } else if (data['status'] == 'FAILED') {
      final payload = data['payload'];
      final errorCode = payload['errorCode'];
      final detail = payload['detail'];
      throw ApiError(errorCode, detail ?? 'Unknown error');
    } else {
      throw ApiError('UNKNOWN_ERROR', 'Unexpected server error.');
    }
  }
}
