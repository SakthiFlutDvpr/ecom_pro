class SubcategoryModel {
  final String categoryCode;
  final String categoryDesc;
  final String? parentCode;
  final String? createdAt;
  final String imageUrl;

  SubcategoryModel(
      {required this.categoryCode,
      required this.categoryDesc,
      this.parentCode,
      this.createdAt,
      required this.imageUrl});

  factory SubcategoryModel.from(Map<String, dynamic> json) {
    return SubcategoryModel(
        categoryCode: json["category_code"],
        categoryDesc: json["category_desc"],
        imageUrl: json["image"]);
  }
}

// List<SubcategoryModel> subCategoryList = [
//   SubcategoryModel(
//     categoryCode: '001',
//     categoryDesc: 'Fruits',
//     parentCode: '000',
//     createdAt: '2024-06-22',
//     imageUrl: 'assets/png/product_2.png',
//   ),
//   SubcategoryModel(
//     categoryCode: '002',
//     categoryDesc: 'Veggies',
//     parentCode: '000',
//     createdAt: '2024-06-22',
//     imageUrl: 'assets/png/product_3.png',
//   ),
//   SubcategoryModel(
//     categoryCode: '003',
//     categoryDesc: 'Groceries',
//     parentCode: '000',
//     createdAt: '2024-06-22',
//     imageUrl: 'assets/png/product_4.png',
//   ),
// ];
