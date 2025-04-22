class PaymobTransactionModel {
  final int id;
  final bool success;
  final bool pending;
  final bool isAuth;
  final bool isCapture;
  final bool isStandalonePayment;
  final bool isVoided;
  final bool isRefunded;
  final int amountCents;
  final DateTime createdAt;
  final String currency;

  PaymobTransactionModel({
    required this.id,
    required this.success,
    required this.pending,
    required this.isAuth,
    required this.isCapture,
    required this.isStandalonePayment,
    required this.isVoided,
    required this.isRefunded,
    required this.amountCents,
    required this.createdAt,
    required this.currency,
  });

  factory PaymobTransactionModel.fromJson(Map<String, dynamic> json) {
    return PaymobTransactionModel(
      id: json['id'],
      success: json['success'],
      pending: json['pending'],
      isAuth: json['is_auth'],
      isCapture: json['is_capture'],
      isStandalonePayment: json['is_standalone_payment'],
      isVoided: json['is_voided'],
      isRefunded: json['is_refunded'],
      amountCents: json['amount_cents'],
      createdAt: DateTime.parse(json['created_at']),
      currency: json['currency'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'success': success,
      'pending': pending,
      'is_auth': isAuth,
      'is_capture': isCapture,
      'is_standalone_payment': isStandalonePayment,
      'is_voided': isVoided,
      'is_refunded': isRefunded,
      'amount_cents': amountCents,
      'created_at': createdAt.toIso8601String(),
      'currency': currency,
    };
  }
}
