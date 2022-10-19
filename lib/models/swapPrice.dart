import 'dart:convert';

class Prices {
  final String userId;
  final double prices;
  Prices({
    required this.userId,
    required this.prices,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'rating': prices,
    };
  }

  factory Prices.fromMap(Map<String, dynamic> map) {
    return Prices(
      userId: map['userId'] ?? '',
      prices: map['rating']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Prices.fromJson(String source) => Prices.fromMap(json.decode(source));
}