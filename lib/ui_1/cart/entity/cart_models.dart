// To parse this JSON data, do
//
//     final cartDataModels = cartDataModelsFromJson(jsonString);

import 'dart:convert';

CartDataModels cartDataModelsFromJson(String str) => CartDataModels.fromJson(json.decode(str));

String cartDataModelsToJson(CartDataModels data) => json.encode(data.toJson());

class CartDataModels {
  final int status;
  final Data data;

  CartDataModels({
    required this.status,
    required this.data,
  });

  factory CartDataModels.fromJson(Map<String, dynamic> json) => CartDataModels(
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class Data {
  final String id;
  final String cartId;
  final String customerId;
  final String addressId;
  final String status;
  final List<CartProduct> cartProducts;
  final String deliveryInstructions;
  final double riderTip;
  final String latitude;
  final String longitude;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Data({
    required this.id,
    required this.cartId,
    required this.customerId,
    required this.addressId,
    required this.status,
    required this.cartProducts,
    required this.deliveryInstructions,
    required this.riderTip,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    cartId: json["cartId"],
    customerId: json["customer_id"],
    addressId: json["address_id"],
    status: json["status"],
    cartProducts: List<CartProduct>.from(json["cartProducts"].map((x) => CartProduct.fromJson(x))),
    deliveryInstructions: json["deliveryInstructions"],
    riderTip: json["riderTip"]?.toDouble(),
    latitude: json["latitude"],
    longitude: json["longitude"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "cartId": cartId,
    "customer_id": customerId,
    "address_id": addressId,
    "status": status,
    "cartProducts": List<dynamic>.from(cartProducts.map((x) => x.toJson())),
    "deliveryInstructions": deliveryInstructions,
    "riderTip": riderTip,
    "latitude": latitude,
    "longitude": longitude,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class CartProduct {
  final String skuCode;
  final String skuName;
  final int salePrice;
  final int quantity;

  CartProduct({
    required this.skuCode,
    required this.skuName,
    required this.salePrice,
    required this.quantity,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
    skuCode: json["skuCode"],
    skuName: json["skuName"],
    salePrice: json["salePrice"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "skuCode": skuCode,
    "skuName": skuName,
    "salePrice": salePrice,
    "quantity": quantity,
  };
}
