import 'package:dio/dio.dart';
import '../../../../core/constants/api_constants.dart';
import '../dto/register_mobile_request.dart';
import '../dto/register_mobile_response.dart';


class RegisterMobileService {
  final Dio _dio = Dio();

  Future<RegisterMobileResponse?> registerDevice(
      RegisterMobileRequest request,
      String jwtToken,
      ) async {
    final response = await _dio.post(
      ApiConstants.registerDevice,
      data: request.toJson(),
      options: Options(
        headers: {'Authorization': 'Bearer $jwtToken'},
      ),
    );

    final data = response.data;

    if (response.statusCode == 200 && data['status'] == '200') {
      return RegisterMobileResponse.fromJson(data['payload']);
    } else {
      throw Exception(data['message']);
    }
  }
}
