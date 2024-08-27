class CartModel {
  final String imgUrl;
  final String name;
  final String weight;
  final String price;
  final String mrp;

  CartModel(
      {required this.imgUrl,
      required this.name,
      required this.weight,
      required this.price,
      required this.mrp});
}

List<CartModel> cartList = [
  CartModel(
    imgUrl: 'https://example.com/images/product1.jpg',
    name: 'Apple',
    weight: '1 kg',
    price: '3.99',
    mrp: '4.99',
  ),
  CartModel(
    imgUrl: 'https://example.com/images/product2.jpg',
    name: 'Banana',
    weight: '1.5 kg',
    price: '2.49',
    mrp: '3.49',
  ),
  CartModel(
    imgUrl: 'https://example.com/images/product3.jpg',
    name: 'Orange',
    weight: '2 kg',
    price: '5.99',
    mrp: '6.99',
  )
];
