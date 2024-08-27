class UserAddressModel {
  final String? street;
  final String? address1;
  final String? address2;
  final String? city;
  final int? zip;
  final String? label;
  final bool? isDefault;
  final String? landmark;

  UserAddressModel(
      {
      this.label,
      this.street,
      this.address1,
      this.address2,
      this.city,
      this.isDefault,
      this.landmark,
      this.zip});
}
