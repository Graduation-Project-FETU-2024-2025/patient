class MedicineModel {
  final String pharmacyName;
  final String branchId;
  final num price;
  final int amountInStock;
  final String productName;
  final String systemProductCode;
  final String productImage;
  final int quantity;

  MedicineModel(
      {required this.pharmacyName,
      required this.branchId,
      required this.price,
      required this.amountInStock,
      required this.productName,
      required this.systemProductCode,
       this.quantity=0,
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

  // copyWith method to create a new instance with modified values
  MedicineModel copyWith({
    String? pharmacyName,
    String? branchId,
    num? price,
    int? amountInStock,
    String? productName,
    String? systemProductCode,
    String? productImage,
    int? quantity,
  }) {
    return MedicineModel(
      pharmacyName: pharmacyName ?? this.pharmacyName,
      branchId: branchId ?? this.branchId,
      price: price ?? this.price,
      amountInStock: amountInStock ?? this.amountInStock,
      productName: productName ?? this.productName,
      systemProductCode: systemProductCode ?? this.systemProductCode,
      productImage: productImage ?? this.productImage,
      quantity: quantity ?? this.quantity,
    );
  }
}
