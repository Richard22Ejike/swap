import 'dart:convert';

import 'package:swap/models/rating.dart';
import 'package:swap/models/swapPrice.dart';



class SwapProduct {
  final String name;
  final String description;
  final List<String> images;
  final String? id;
  final String userId;
  final List<Prices>? prices;
  SwapProduct({
    required this.userId,
    required this.name,
    required this.description,
    required this.images,
    this.id,
    this.prices,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'images': images,
      'prices': prices,
      'id': id,
      'userId': userId,
    };
  }

  factory SwapProduct.fromMap(Map<String, dynamic> map) {
    return SwapProduct(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      images: List<String>.from(map['images']),
      userId: map['userId'] ?? '',
      id: map['_id'],
      prices: map['prices'] != null
          ? List<Prices>.from(
        map['prices']?.map(
              (x) => Rating.fromMap(x),
        ),
      )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SwapProduct.fromJson(String source) =>
      SwapProduct.fromMap(json.decode(source));
}