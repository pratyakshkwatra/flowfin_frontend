import 'dart:convert';

class Wallet {
  final int id;
  final String address;
  final String chain;
  final String nickname;

  Wallet({
    required this.id,
    required this.address,
    required this.chain,
    required this.nickname,
  });

  factory Wallet.fromMap(Map<String, dynamic> map) {
    return Wallet(
      id: map['id'],
      address: map['address'],
      chain: map['chain'],
      nickname: map["nickname"],
    );
  }

  factory Wallet.fromJson(String source) => Wallet.fromMap(json.decode(source));
}
