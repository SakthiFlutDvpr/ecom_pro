// To parse this JSON data, do
//
//     final categoryList = categoryListFromJson(jsonString);

import 'dart:convert';

CategoryList categoryListFromJson(String str) =>
    CategoryList.fromJson(json.decode(str));

String categoryListToJson(CategoryList data) => json.encode(data.toJson());

class CategoryList {
  final String? message;
  final int? count;
  final List<Datum>? data;

  CategoryList({
    this.message,
    this.count,
    this.data,
  });

  factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
        message: json["message"]["message"],
        count: json["message"]["count"],
        data: List<Datum>.from(
            json["message"]["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "count": count,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final String categoryCode;
  final String categoryDesc;
  final String image;
  final int sort;

  Datum({
    required this.categoryCode,
    required this.categoryDesc,
    required this.image,
    required this.sort,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        categoryCode: json["category_code"],
        categoryDesc: json["category_desc"],
        image: json["image"],
        sort: json["sort"],
      );

  Map<String, dynamic> toJson() => {
        "category_code": categoryCode,
        "category_desc": categoryDesc,
        "image": image,
        "sort": sort,
      };
}
