class ApiResponse {
  final int status;
  final String message;
  final List<Product> data;

  ApiResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      status: json['status'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((item) => Product.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Product {
  final String id;
  final String skuCode;
  final String skuName;
  final String size;
  final String salePrice;
  final String baseCost;
  final String imageURL;

  Product({
    required this.id,
    required this.skuCode,
    required this.skuName,
    required this.size,
    required this.salePrice,
    required this.baseCost,
    required this.imageURL,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'] as String,
      skuCode: json['skuCode'] as String,
      skuName: json['skuName'] as String,
      size: json['size'] as String,
      salePrice: json['salePrice'] as String,
      baseCost: json['baseCost'] as String,
      imageURL: json['imageURL'] as String? ?? '',
    );
  }
}
