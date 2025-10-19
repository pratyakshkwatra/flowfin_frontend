import 'package:flowfin/api/models/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'api_client.dart';
import 'exceptions.dart';

class AuthAPI {
  final _dio = ApiClient().dio;
  final _storage = const FlutterSecureStorage();

  Future<User> signIn(String email, String password) async {
    try {
      final response = await _dio.post(
        '/auth/sign_in',
        data: {'email': email, 'password': password},
      );

      final data = response.data;
      final user = User.fromJson(data);

      await _storage.write(key: 'access_token', value: user.accessToken);
      await _storage.write(key: 'refresh_token', value: user.refreshToken);

      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw APIException('Invalid credentials', e.response!.statusCode);
      }

      throw APIException(
        e.message ?? 'An Error Occurred',
        e.response!.statusCode,
      );
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      await _dio.post(
        '/auth/sign_up',
        data: {'email': email, 'password': password},
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw APIException('email already exists', e.response!.statusCode);
      }
      throw APIException(
        e.message ?? 'An Error Occurred',
        e.response!.statusCode,
      );
    }
  }

  Future<User?> refreshToken() async {
    final refreshToken = await _storage.read(key: 'refresh_token');
    if (refreshToken == null) return null;

    try {
      final res = await _dio.post(
        '/auth/refresh_token',
        data: {'refresh_token': refreshToken},
      );
      await _storage.write(
        key: 'access_token',
        value: res.data['access_token'],
      );
      return User.fromJson(res.data);
    } catch (error) {
      await _storage.deleteAll();
      return null;
    }
  }

  Future<void> logout(String refreshToken, String accessToken) async {
    await _dio.post(
      '/auth/sign_out',
      queryParameters: {
        'refresh_token': refreshToken,
        "access_token": accessToken,
      },
      options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
    );
    await _storage.deleteAll();
  }
}
