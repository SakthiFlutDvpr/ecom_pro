class CustomerLoginDetails {
  final String status;
  final String message;
  final Customer customer;

  CustomerLoginDetails({
    required this.status,
    required this.message,
    required this.customer,
  });

  factory CustomerLoginDetails.fromJson(Map<String, dynamic> json) =>
      CustomerLoginDetails(
        status: json["status"],
        message: json["message"],
        customer: Customer.fromJson(json["customer"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "customer": customer.toJson(),
      };
}

class Customer {
  final String id;
  final String customerId;
  final int phoneNumber;
//  final bool isVerified;
  final int v;
  final DateTime lastLogin;
  final String email;
  final String name;
  final int customerCode;

  Customer({
    required this.id,
    required this.customerId,
    required this.phoneNumber,
    // required this.isVerified,
    required this.v,
    required this.lastLogin,
    required this.email,
    required this.name,
    required this.customerCode,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["_id"],
        customerId: json["customer_id"],
        phoneNumber: json["phoneNumber"],
        // isVerified: json["isVerified"],
        v: json["__v"],
        lastLogin: DateTime.parse(json["lastLogin"]),
        email: json["email"],
        name: json["name"],
        customerCode: json["customerCode"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "customer_id": customerId,
        "phoneNumber": phoneNumber,
        // "isVerified": isVerified,
        "__v": v,
        "lastLogin": lastLogin.toIso8601String(),
        "email": email,
        "name": name,
        "customerCode": customerCode,
      };
}
