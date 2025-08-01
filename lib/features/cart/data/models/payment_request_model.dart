class PaymentRequestModel {
  final String orderId;
  final String paymentMethod;
  final String merchantId;
  final num amount;
  final String currency;

  PaymentRequestModel({
    required this.orderId,
    this.paymentMethod = 'Credit',
    this.merchantId = '82577589-fdf1-40db-8739-d283009d423c',
    required this.amount,
    this.currency = 'EG',
  });

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'paymentMethod': paymentMethod,
      'merchant_order_id': merchantId,
      'Amount': amount,
      'Currency': currency,
    };
  }
}
