class MedicineModel {
  final String pharmacyName;
  final String branchId;
  final num price;
  final int amountInStock;
  final String productName;
  final String systemProductCode;
  final String productImage;

  MedicineModel(
      {required this.pharmacyName,
      required this.branchId,
      required this.price,
      required this.amountInStock,
      required this.productName,
      required this.systemProductCode,
      required this.productImage});

  factory MedicineModel.fromJson(Map<String, dynamic> json) {
    return MedicineModel(
      pharmacyName: json['pharmacyName'] as String,
      branchId: json['branchId'] as String,
      price: json['price'] as num,
      amountInStock: json['stock'] as int,
      productName: json['productName'] as String,
      systemProductCode: json['systemProductCode'] as String,
      productImage: json['productImage'] as String,
    );
  }
}
