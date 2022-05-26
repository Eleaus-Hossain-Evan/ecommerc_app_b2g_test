import 'dart:convert';

import 'package:ecommerc_app_b2g_test/models/product_list_model.dart';

class CartModel {
  String id;
  int count;

  CartModel({
    required this.id,
    required this.count,
  });

  factory CartModel.init() => CartModel(id: "", count: 0);

  CartModel copyWith({
    String? id,
    int? count,
  }) {
    return CartModel(
      id: id ?? this.id,
      count: count ?? this.count,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'count': count,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'] ?? '',
      count: map['count']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source));

  @override
  String toString() => 'CartModel(id: $id, count: $count)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartModel && other.id == id && other.count == count;
  }

  @override
  int get hashCode => id.hashCode ^ count.hashCode;
}
