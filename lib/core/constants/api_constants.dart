import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static final String baseUrl = dotenv.env['BASE_URL'] ?? '';

  static String get cifVerification => '$baseUrl${dotenv.env['CIF_VERIFICATION']}';
  static String get registerDevice => '$baseUrl${dotenv.env['REGISTER_DEVICE']}';
  static String get createMpin => '$baseUrl${dotenv.env['CREATE_MPIN']}';
  static String get loginMpin => '$baseUrl${dotenv.env['LOGIN_MPIN']}';
  static String get logout => '$baseUrl${dotenv.env['LOGOUT']}';
}
