import '../../domain/entities/transaction.dart';

class TransactionModel extends Transaction {
  const TransactionModel({
    required String id,
    required String description,
    required double amount,
    required DateTime date,
    required String debitAccountId,
    required String creditAccountId,
    required String type,
  }) : super(
          id: id,
          description: description,
          amount: amount,
          date: date,
          debitAccountId: debitAccountId,
          creditAccountId: creditAccountId,
          type: type,
        );

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['_id'] ?? '',
      description: json['description'] ?? '',
      amount: (json['amount'] ?? 0).toDouble(),
      date: DateTime.parse(json['date']),
      debitAccountId: json['debitAccountId']['_id'] ?? json['debitAccountId'],
      creditAccountId: json['creditAccountId']['_id'] ?? json['creditAccountId'],
      type: json['type'] ?? 'Journal',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'amount': amount,
      'date': date.toIso8601String(),
      'debitAccountId': debitAccountId,
      'creditAccountId': creditAccountId,
      'type': type,
    };
  }
}
