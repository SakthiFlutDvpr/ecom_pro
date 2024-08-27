class ProductModel {
  final String skuCode;
  final String imageUrl;
  final String title;
  final String size;
  final String price;
  final String mrp;
  final String offer;
  final List<Varient> varients;
  final String isStocked;

  ProductModel({
    required this.skuCode,
    required this.imageUrl,
    required this.title,
    required this.size,
    required this.price,
    required this.mrp,
    required this.offer,
    required this.varients,
    required this.isStocked,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      skuCode: json['skuCode'] as String,
      imageUrl: json['image'] as String,
      title: json['skuName'] as String,
      size: json['size'] as String,
      price: json['price'] as String,
      mrp: json['mrp'] as String,
      offer: json['offer'] as String,
      varients: (json['Variants'] as List<dynamic>)
          .map((v) => Varient.fromJson(v as Map<String, dynamic>))
          .toList(),
      isStocked: json['isStocked'] as String,
    );
  }
}

class Varient {
  final String skuCode;
  final String imageUrl;
  final String title;
  final String size;
  final String price;
  final String mrp;
  final String offer;
  int quantity;
  bool clicked;

  Varient({
    required this.skuCode,
    required this.imageUrl,
    required this.title,
    required this.size,
    required this.price,
    required this.mrp,
    required this.offer,
    required this.quantity,
    required this.clicked,
  });

  factory Varient.fromJson(Map<String, dynamic> json) {
    return Varient(
      skuCode: json['skuCode'] as String,
      imageUrl: json['imageUrl'] as String,
      title: json['title'] as String,
      size: json['size'] as String,
      price: json['price'] as String,
      mrp: json['mrp'] as String,
      offer: json['offer'] as String,
      quantity: json['quantity'] as int? ?? 0,
      clicked: json['clicked'] as bool? ?? false,
    );
  }
}

List<ProductModel> productList = [
  ProductModel(
    skuCode: 'SKU001',
    imageUrl: 'assets/png/product_1.png',
    title: 'Product 1',
    size: "500g",
    price: '10.00',
    mrp: '12.00',
    offer: '10%',
    isStocked: "yes",
    varients: [
      Varient(
        skuCode: 'SKU001',
        imageUrl: 'assets/png/product_1.png',
        title: 'Product 1',
        size: "500g",
        price: '10.00',
        mrp: '12.00',
        offer: '10%',
        quantity: 0,
        clicked: false,
      ),
      Varient(
        skuCode: 'SKU002',
        imageUrl: 'assets/png/product_1.png',
        title: 'Product 2',
        size: "100g",
        price: '20.00',
        mrp: '24.00',
        offer: '10%',
        quantity: 0,
        clicked: false,
      )
    ],
  ),
  ProductModel(
    skuCode: 'SKU003',
    imageUrl: 'assets/png/product_1.png',
    title: 'Product 3',
    size: "500g",
    price: '20.00',
    mrp: '25.00',
    offer: '15%',
    isStocked: "yes",
    varients: [
      Varient(
        skuCode: 'SKU003',
        imageUrl: 'assets/png/product_1.png',
        title: 'Product 3',
        size: "500g",
        price: '10.00',
        mrp: '12.00',
        offer: '10%',
        quantity: 0,
        clicked: false,
      ),
      Varient(
        skuCode: 'SKU004',
        imageUrl: 'assets/png/product_1.png',
        title: 'Product 4',
        size: "100g",
        price: '20.00',
        mrp: '24.00',
        offer: '10%',
        quantity: 0,
        clicked: false,
      )
    ],
  ),
  ProductModel(
      skuCode: 'SKU005',
      imageUrl: 'assets/png/product_1.png',
      title: 'Product 5',
      size: "500g",
      price: '30.00',
      mrp: '35.00',
      offer: '20%',
      varients: [
        Varient(
          skuCode: 'SKU005',
          imageUrl: 'assets/png/product_1.png',
          title: 'Product 5',
          size: "500g",
          price: '10.00',
          mrp: '12.00',
          offer: '10%',
          quantity: 0,
          clicked: false,
        ),
        Varient(
          skuCode: 'SKU006',
          imageUrl: 'assets/png/product_1.png',
          title: 'Product 6',
          size: "100g",
          price: '20.00',
          mrp: '24.00',
          offer: '10%',
          quantity: 0,
          clicked: false,
        )
      ],
      isStocked: "yes"),
  ProductModel(
    skuCode: 'SKU007',
    imageUrl: 'assets/png/product_1.png',
    title: 'Product 7',
    size: "500g",
    price: '40.00',
    mrp: '50.00',
    offer: '25%',
    isStocked: "yes",
    varients: [
      Varient(
        skuCode: 'SKU007',
        imageUrl: 'assets/png/product_1.png',
        title: 'Product 7',
        size: "500g",
        price: '10.00',
        mrp: '12.00',
        offer: '10%',
        quantity: 0,
        clicked: false,
      ),
      Varient(
        skuCode: 'SKU008',
        imageUrl: 'assets/png/product_1.png',
        title: 'Product 8',
        size: "100g",
        price: '20.00',
        mrp: '24.00',
        offer: '10%',
        quantity: 0,
        clicked: false,
      )
    ],
  ),
  ProductModel(
    skuCode: 'SKU009',
    imageUrl: 'assets/png/product_1.png',
    title: 'Product 9',
    size: "500g",
    price: '50.00',
    mrp: '60.00',
    offer: '30%',
    isStocked: "yes",
    varients: [
      Varient(
        skuCode: 'SKU009',
        imageUrl: 'assets/png/product_1.png',
        title: 'Product 9',
        size: "500g",
        price: '10.00',
        mrp: '12.00',
        offer: '10%',
        quantity: 0,
        clicked: false,
      ),
      Varient(
        skuCode: 'SKU0010',
        imageUrl: 'assets/png/product_1.png',
        title: 'Product 10',
        size: "100g",
        price: '20.00',
        mrp: '24.00',
        offer: '10%',
        quantity: 0,
        clicked: false,
      )
    ],
  ),
  ProductModel(
    skuCode: 'SKU0011',
    imageUrl: 'assets/png/product_1.png',
    title: 'Product 11',
    size: "500g",
    price: '60.00',
    mrp: '70.00',
    offer: '35%',
    isStocked: "no",
    varients: [
      Varient(
        skuCode: 'SKU0011',
        imageUrl: 'assets/png/product_1.png',
        title: 'Product 11',
        size: "500g",
        price: '10.00',
        mrp: '12.00',
        offer: '10%',
        quantity: 0,
        clicked: false,
      ),
      Varient(
        skuCode: 'SKU0012',
        imageUrl: 'assets/png/product_1.png',
        title: 'Product 12',
        size: "100g",
        price: '20.00',
        mrp: '24.00',
        offer: '10%',
        quantity: 0,
        clicked: false,
      )
    ],
  ),
  ProductModel(
    skuCode: 'SKU0013',
    imageUrl: 'assets/png/product_1.png',
    title: 'Product 13',
    size: "500g",
    price: '70.00',
    mrp: '80.00',
    offer: '40%',
    isStocked: "no",
    varients: [
      Varient(
        skuCode: 'SKU0013',
        imageUrl: 'assets/png/product_1.png',
        title: 'Product 13',
        size: "500g",
        price: '10.00',
        mrp: '12.00',
        offer: '10%',
        quantity: 0,
        clicked: false,
      ),
      Varient(
        skuCode: 'SKU0014',
        imageUrl: 'assets/png/product_1.png',
        title: 'Product 14',
        size: "100g",
        price: '20.00',
        mrp: '24.00',
        offer: '10%',
        quantity: 0,
        clicked: false,
      )
    ],
  ),
  ProductModel(
    skuCode: 'SKU0015',
    imageUrl: 'assets/png/banana.png',
    title: 'Product 15',
    size: "500g",
    price: '80.00',
    mrp: '90.00',
    offer: '45%',
    isStocked: "yes",
    varients: [
      Varient(
        skuCode: 'SKU0015',
        imageUrl: 'assets/png/product_1.png',
        title: 'Product 15',
        size: "500g",
        price: '10.00',
        mrp: '12.00',
        offer: '10%',
        quantity: 0,
        clicked: false,
      ),
      Varient(
        skuCode: 'SKU0016',
        imageUrl: 'assets/png/product_1.png',
        title: 'Product 16',
        size: "100g",
        price: '20.00',
        mrp: '24.00',
        offer: '10%',
        quantity: 0,
        clicked: false,
      )
    ],
  ),
  ProductModel(
      skuCode: 'SKU0017',
      imageUrl: 'assets/png/product_1.png',
      title: 'Product 17',
      size: "500g",
      price: '90.00',
      mrp: '100.00',
      offer: '50%',
      varients: [
        Varient(
          skuCode: 'SKU0017',
          imageUrl: 'assets/png/product_1.png',
          title: 'Product 17',
          size: "500g",
          price: '10.00',
          mrp: '12.00',
          offer: '10%',
          quantity: 0,
          clicked: false,
        ),
        Varient(
          skuCode: 'SKU0018',
          imageUrl: 'assets/png/product_1.png',
          title: 'Product 18',
          size: "100g",
          price: '20.00',
          mrp: '24.00',
          offer: '10%',
          quantity: 0,
          clicked: false,
        )
      ],
      isStocked: "yes"),
  ProductModel(
    skuCode: 'SKU019',
    imageUrl: 'assets/png/product_1.png',
    title: 'Product 19',
    size: "500g",
    price: '100.00',
    mrp: '110.00',
    offer: '55%',
    isStocked: "yes",
    varients: [
      Varient(
        skuCode: 'SKU0019',
        imageUrl: 'assets/png/product_1.png',
        title: 'Product 19',
        size: "500g",
        price: '10.00',
        mrp: '12.00',
        offer: '10%',
        quantity: 0,
        clicked: false,
      ),
      Varient(
        skuCode: 'SKU0020',
        imageUrl: 'assets/png/product_1.png',
        title: 'Product 20',
        size: "100g",
        price: '20.00',
        mrp: '24.00',
        offer: '10%',
        quantity: 0,
        clicked: false,
      )
    ],
  ),
];
