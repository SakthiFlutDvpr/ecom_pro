class Orderlist {
  final String status;
  final String date;
  final String time;
  final String orderdetails;
  final String amount;
  final String productname;
  final List<String> imageUrls;

  Orderlist({
    required this.status,
    required this.orderdetails,
    required this.date,
    required this.time,
    required this.productname,
    required this.amount,
    required this.imageUrls,
  });
}
