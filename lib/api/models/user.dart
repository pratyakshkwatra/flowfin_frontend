
class User {
  final int id;
  final String email;
  final bool isActive;
  final String? accessToken;
  final String? refreshToken;
  final String? tokenType;

  User({
    required this.id,
    required this.email,
    required this.isActive,
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user']['id'],
      email: json['user']['email'],
      isActive: json['user']['is_active'],
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
      tokenType: json['token_type'],
    );
  }
}
