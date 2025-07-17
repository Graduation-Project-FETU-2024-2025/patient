class MakeOrderRequestModel {
  final String userName;
  final String userEmail;
  final String userAddress;
  final int userLat;
  final int userLong;
  final String branchId;
  final List<OrderItem> orderItems;

  MakeOrderRequestModel(
      {required this.userName,
      required this.userEmail,
      required this.userAddress,
      required this.userLat,
      required this.userLong,
      required this.branchId,
      required this.orderItems});
  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'userEmail': userEmail,
      'userAddress': userAddress,
      'userLat': userLat,
      'userLong': userLong,
      'branchId': branchId,
      'orderItems': orderItems
          .map((item) => {
                'systemProductCode': item.systemProductCode,
                'systemProductPrice': item.systemProductPrice,
                'quantity': item.quantity,
              })
          .toList(),
    };
  }
}

class OrderItem {
  final String systemProductCode;
  final num systemProductPrice;
  final int quantity;

  OrderItem({
    required this.systemProductCode,
    required this.systemProductPrice,
    required this.quantity,
  });
}
