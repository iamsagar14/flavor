// 🎯 Dart imports:
import 'dart:convert';

// 📦 Package imports:
import 'package:equatable/equatable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class Token extends Equatable {
  final String access;
  final String refresh;

  const Token({
    required this.access,
    required this.refresh,
  });

  Token copyWith({
    String? access,
    String? refresh,
  }) {
    return Token(
      access: access ?? this.access,
      refresh: refresh ?? this.refresh,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "access": access,
      "refresh": refresh,
    };
  }

  factory Token.fromMap(Map<String, dynamic> map) {
    return Token(
      access: map["access"] ?? '',
      refresh: map["refresh"] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Token.fromJson(String source) => Token.fromMap(json.decode(source));

  @override
  String toString() => 'Token(access: $access, refresh: $refresh)';

  @override
  List<Object> get props => [access, refresh];

  bool get accessTokenExpired {
    return JwtDecoder.isExpired(access);
  }

  bool get refreshTokenExpired {
    return JwtDecoder.isExpired(refresh);
  }
}
