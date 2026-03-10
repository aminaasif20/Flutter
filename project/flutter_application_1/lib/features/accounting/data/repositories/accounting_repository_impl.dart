import '../../domain/entities/account.dart';
import '../../domain/entities/transaction.dart';
import '../../domain/repositories/accounting_repository.dart';
import '../datasources/accounting_remote_datasource.dart';
import '../models/account_model.dart';
import '../models/transaction_model.dart';

class AccountingRepositoryImpl implements AccountingRepository {
  final AccountingRemoteDataSource remoteDataSource;

  AccountingRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Account>> getAccounts() async {
    return await remoteDataSource.getAccounts();
  }

  @override
  Future<Account> createAccount(Account account) async {
    final model = AccountModel(
      id: account.id,
      name: account.name,
      type: account.type,
      balance: account.balance,
    );
    return await remoteDataSource.createAccount(model);
  }

  @override
  Future<List<Transaction>> getTransactions() async {
    return await remoteDataSource.getTransactions();
  }

  @override
  Future<Transaction> createTransaction(Transaction transaction) async {
    final model = TransactionModel(
      id: transaction.id,
      description: transaction.description,
      amount: transaction.amount,
      date: transaction.date,
      debitAccountId: transaction.debitAccountId,
      creditAccountId: transaction.creditAccountId,
      type: transaction.type,
    );
    return await remoteDataSource.createTransaction(model);
  }
}
