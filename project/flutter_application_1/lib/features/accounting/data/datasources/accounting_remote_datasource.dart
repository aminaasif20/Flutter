import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/error/failures.dart';
import '../models/account_model.dart';
import '../models/transaction_model.dart';
import '../models/invoice_model.dart';

abstract class AccountingRemoteDataSource {
  Future<List<AccountModel>> getAccounts();
  Future<AccountModel> createAccount(AccountModel account);
  Future<List<TransactionModel>> getTransactions();
  Future<TransactionModel> createTransaction(TransactionModel transaction);
}

class AccountingRemoteDataSourceImpl implements AccountingRemoteDataSource {
  final http.Client client;
  final String baseUrl = 'http://localhost:5000/api';

  AccountingRemoteDataSourceImpl({required this.client});

  @override
  Future<List<AccountModel>> getAccounts() async {
    final response = await client.get(Uri.parse('$baseUrl/accounts'));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => AccountModel.fromJson(e)).toList();
    } else {
      throw const ServerFailure('Failed to load accounts');
    }
  }

  @override
  Future<AccountModel> createAccount(AccountModel account) async {
    final response = await client.post(
      Uri.parse('$baseUrl/accounts'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(account.toJson()),
    );
    if (response.statusCode == 201) {
      return AccountModel.fromJson(json.decode(response.body));
    } else {
      throw const ServerFailure('Failed to create account');
    }
  }

  @override
  Future<List<TransactionModel>> getTransactions() async {
    final response = await client.get(Uri.parse('$baseUrl/transactions'));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => TransactionModel.fromJson(e)).toList();
    } else {
      throw const ServerFailure('Failed to load transactions');
    }
  }

  @override
  Future<TransactionModel> createTransaction(TransactionModel transaction) async {
    final response = await client.post(
      Uri.parse('$baseUrl/transactions'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(transaction.toJson()),
    );
    if (response.statusCode == 201) {
      return TransactionModel.fromJson(json.decode(response.body));
    } else {
      throw const ServerFailure('Failed to create transaction');
    }
  }
}
