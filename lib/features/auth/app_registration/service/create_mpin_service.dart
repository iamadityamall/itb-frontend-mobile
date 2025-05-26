import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../core/constants/api_constants.dart';
import '../dto/create_mpin_request.dart';
import '../dto/create__mpin_response.dart';

class CreateMpinService {
  final Dio _dio = Dio();
  final box = GetStorage();
  final _storage = const FlutterSecureStorage();

  Future<CreateMpinResponse> createMpin(
    CreateMpinRequest request,
    String jwt,
  ) async {
    _dio.options.headers['Authorization'] = 'Bearer $jwt';

    final response = await _dio.post(
      ApiConstants.createMpin,
      data: request.toJson(),
    );

    if (response.statusCode == 200) {
      box.write("isRegistered", true);
      return CreateMpinResponse.fromJson(response.data);
    } else {
      throw Exception(response.data['message'] ?? 'Failed to create MPIN');
    }
  }
}
