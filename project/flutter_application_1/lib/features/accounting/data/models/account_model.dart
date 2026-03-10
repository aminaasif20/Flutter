import '../../domain/entities/account.dart';

class AccountModel extends Account {
  const AccountModel({
    required String id,
    required String name,
    required String type,
    required double balance,
  }) : super(id: id, name: name, type: type, balance: balance);

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      balance: (json['balance'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'balance': balance,
    };
  }
}
