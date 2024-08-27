// ignore_for_file: constant_identifier_names

import 'dart:convert'; // Ensure you import this to use json.decode

// To parse this JSON data, do
//
//     final dashboardModel = dashboardModelFromJson(jsonString);

DashboardModel dashboardModelFromJson(String str) =>
    DashboardModel.fromJson(json.decode(str));

class DashboardModel {
  final Data data;

  DashboardModel({
    required this.data,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
        data: Data.fromJson(json["data"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  final int aboveBannerCount;
  final int belowBannerCount;
  final List<Banner> aboveBanners;
  final List<Category> categories;
  final List<Category> subcategories;
  final List<Banner> belowBanners;

  Data({
    required this.aboveBannerCount,
    required this.belowBannerCount,
    required this.aboveBanners,
    required this.categories,
    required this.subcategories,
    required this.belowBanners,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        aboveBannerCount: json["aboveBannerCount"] ?? 0,
        belowBannerCount: json["belowBannerCount"] ?? 0,
        aboveBanners: json["aboveBanners"] == null
            ? []
            : List<Banner>.from(
                json["aboveBanners"].map((x) => Banner.fromJson(x))),
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"].map((x) => Category.fromJson(x))),
        subcategories: json["subcategories"] == null
            ? []
            : List<Category>.from(
                json["subcategories"].map((x) => Category.fromJson(x))),
        belowBanners: json["belowBanners"] == null
            ? []
            : List<Banner>.from(
                json["belowBanners"].map((x) => Banner.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "aboveBannerCount": aboveBannerCount,
        "belowBannerCount": belowBannerCount,
        "aboveBanners": List<dynamic>.from(aboveBanners.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "subcategories":
            List<dynamic>.from(subcategories.map((x) => x.toJson())),
        "belowBanners": List<dynamic>.from(belowBanners.map((x) => x.toJson())),
      };
}

class Banner {
  final String id;
  final String bannerId;
  final String orgId;
  final String bannerName;
  final bool showBannerName;
  final bool isAboveCategory;
  final int sortOrder;
  final String grid;
  final List<ImageUrl> images;
  final bool status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final DateTime? expiredAt;

  Banner({
    required this.id,
    required this.bannerId,
    required this.orgId,
    required this.bannerName,
    required this.showBannerName,
    required this.isAboveCategory,
    required this.sortOrder,
    required this.grid,
    required this.images,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.expiredAt,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json["_id"] ?? '',
        bannerId: json["banner_id"] ?? '',
        orgId: json["org_id"] ?? '',
        bannerName: json["banner_name"] ?? '',
        showBannerName: json["show_banner_name"] ?? false,
        isAboveCategory: json["is_above_category"] ?? false,
        sortOrder: json["sort_order"] ?? 0,
        grid: json["grid"] ?? '',
        images: json["images"] == null
            ? []
            : List<ImageUrl>.from(
                json["images"].map((x) => ImageUrl.fromJson(x))),
        status: json["status"] ?? false,
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"] ?? 0,
        expiredAt: json["expiredAt"] == null
            ? null
            : DateTime.parse(json["expiredAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "banner_id": bannerId,
        "org_id": orgId,
        "banner_name": bannerName,
        "show_banner_name": showBannerName,
        "is_above_category": isAboveCategory,
        "sort_order": sortOrder,
        "grid": grid,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "expiredAt": expiredAt?.toIso8601String(),
      };
}

class ImageUrl {
  final String imageUrl;
  final String webImageUrl;
  final LinkUrl linkUrl;
  final LinkType linkType;
  final String id;

  ImageUrl({
    required this.imageUrl,
    required this.webImageUrl,
    required this.linkUrl,
    required this.linkType,
    required this.id,
  });

  factory ImageUrl.fromJson(Map<String, dynamic> json) => ImageUrl(
        imageUrl: json["image_url"] ?? '',
        webImageUrl: json["web_image_url"] ?? '',
        linkUrl: linkUrlValues.map[json["link_url"]]!,
        linkType: linkTypeValues.map[json["link_type"]]!,
        id: json["_id"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "image_url": imageUrl,
        "web_image_url": webImageUrl,
        "link_url": linkUrlValues.reverse[linkUrl],
        "link_type": linkTypeValues.reverse[linkType],
        "_id": id,
      };
}

enum LinkType { CAT, PRODUCT, SUBCAT }

final linkTypeValues = EnumValues({
  "cat": LinkType.CAT,
  "product": LinkType.PRODUCT,
  "subcat": LinkType.SUBCAT
});

enum LinkUrl { BEV, S08, V01 }

final linkUrlValues =
    EnumValues({"BEV": LinkUrl.BEV, "S08": LinkUrl.S08, "V01": LinkUrl.V01});

class Category {
  final String id;
  final String categoryCode;
  final String categoryDesc;
  final String? image;
  final int? sort;
  final DateTime createdAt;
  final int v;
  final String? grid;
  final ParentCode? parentCode;
  final String? categoryId;

  Category({
    required this.id,
    required this.categoryCode,
    required this.categoryDesc,
    this.image,
    this.sort,
    required this.createdAt,
    required this.v,
    this.grid,
    this.parentCode,
    this.categoryId,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"] ?? '',
        categoryCode: json["category_code"] ?? '',
        categoryDesc: json["category_desc"] ?? '',
        image: json["image"],
        sort: json["sort"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"] ?? 0,
        grid: json["grid"],
        parentCode: parentCodeValues.map[json["parent_code"]],
        categoryId: json["category_id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "category_code": categoryCode,
        "category_desc": categoryDesc,
        "image": image,
        "sort": sort,
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
        "grid": grid,
        "parent_code": parentCodeValues.reverse[parentCode],
        "category_id": categoryId,
      };
}

enum ParentCode { EMPTY, FV1, GR1, V01 }

final parentCodeValues = EnumValues({
  "": ParentCode.EMPTY,
  "FV1": ParentCode.FV1,
  "GR1": ParentCode.GR1,
  "V01": ParentCode.V01
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
