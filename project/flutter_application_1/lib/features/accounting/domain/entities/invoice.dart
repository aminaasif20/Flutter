import 'package:equatable/equatable.dart';

class Invoice extends Equatable {
  final String id;
  final String customerId;
  final String customerName;
  final List<InvoiceItem> items;
  final double totalAmount;
  final DateTime dueDate;
  final bool isPaid;

  const Invoice({
    required this.id,
    required this.customerId,
    required this.customerName,
    required this.items,
    required this.totalAmount,
    required this.dueDate,
    required this.isPaid,
  });

  @override
  List<Object?> get props => [id, customerId, customerName, items, totalAmount, dueDate, isPaid];
}

class InvoiceItem extends Equatable {
  final String description;
  final double quantity;
  final double unitPrice;
  final double total;

  const InvoiceItem({
    required this.description,
    required this.quantity,
    required this.unitPrice,
    required this.total,
  });

  @override
  List<Object?> get props => [description, quantity, unitPrice, total];
}
