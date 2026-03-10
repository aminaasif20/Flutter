import 'package:equatable/equatable.dart';

class Account extends Equatable {
  final String id;
  final String name;
  final String type; // Asset, Liability, Equity, Revenue, Expense
  final double balance;

  const Account({
    required this.id,
    required this.name,
    required this.type,
    required this.balance,
  });

  @override
  List<Object?> get props => [id, name, type, balance];
}
