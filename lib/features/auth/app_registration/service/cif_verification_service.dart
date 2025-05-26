import 'package:aifinno_atlas_mobile_app/core/error/api_error.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../../core/constants/api_constants.dart';
import '../dto/cif_verification_request.dart';
import '../dto/cif_verification_response.dart';

class CifVerificationService {
  final Dio _dio = Dio();
  final _storage = const FlutterSecureStorage();

  Future<CifVerificationResponse?> verifyCif(
      CifVerificationRequest request,
      ) async {
    final response = await _dio.post(
      ApiConstants.cifVerification,
      data: request.toJson(),
      options: Options(
        validateStatus: (status) {
          // Accept all status codes below 500 to handle 4xx in-code
          return status != null && status < 500;
        },
      ),
    );

    final data = response.data;
    print("Response data: $data");

    if (response.statusCode == 200 && data['status'] == 'SUCCESS') {
      final payload = data['payload'];
      await _storage.write(key: 'jwt_token', value: payload['jwt']);
      return CifVerificationResponse.fromJson(payload);
    } else if (data['status'] == 'FAILED') {
      final payload = data['payload'];
      final errorCode = payload['errorCode'];
      final detail = payload['detail'];
      print("ApiError: $errorCode - $detail");
      throw ApiError(errorCode, detail); // use detailed error
    } else {
      throw ApiError('UNKNOWN_ERROR', 'An unknown error occurred');
    }
  }
}
