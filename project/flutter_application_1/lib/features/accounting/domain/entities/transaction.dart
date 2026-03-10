import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  final String id;
  final String description;
  final double amount;
  final DateTime date;
  final String debitAccountId;
  final String creditAccountId;
  final String type; // Journal, Invoice, Payment, etc.

  const Transaction({
    required this.id,
    required this.description,
    required this.amount,
    required this.date,
    required this.debitAccountId,
    required this.creditAccountId,
    required this.type,
  });

  @override
  List<Object?> get props => [
        id,
        description,
        amount,
        date,
        debitAccountId,
        creditAccountId,
        type,
      ];
}
