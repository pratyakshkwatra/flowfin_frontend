import 'package:flowfin/api/auth.dart';
import 'package:flowfin/api/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final AuthAPI _authAPI;
  final FlutterSecureStorage _secureStorage;

  AuthService(this._authAPI, this._secureStorage);

  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';

  Future<User?> login(String email, String password) async {
    try {
      final user = await _authAPI.signIn(email, password);
      await _secureStorage.write(key: _accessTokenKey, value: user.accessToken);
      await _secureStorage.write(
          key: _refreshTokenKey, value: user.refreshToken);

      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    await _secureStorage.delete(key: _accessTokenKey);
    await _secureStorage.delete(key: _refreshTokenKey);
  }

  Future<String?> getAccessToken() async {
    return await _secureStorage.read(key: _accessTokenKey);
  }

  Future<String?> getRefreshToken() async {
    return await _secureStorage.read(key: _refreshTokenKey);
  }

  Future<bool> isLoggedIn() async {
    final token = await getAccessToken();
    return token != null;
  }

  Future<User?> initializeSession() async {
    return await _authAPI.refreshToken();
  }

  Future<void> register(String email, String password) async {
    try {
      await _authAPI.signUp(email, password);
    } catch (e) {
      rethrow;
    }
  }
}