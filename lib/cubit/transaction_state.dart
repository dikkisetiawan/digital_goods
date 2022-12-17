part of 'transaction_cubit.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class CreateTransactionSuccess extends TransactionState {
  final CreateTransactionModel createTransactionGetData;

  CreateTransactionSuccess(this.createTransactionGetData);

  @override
  List<Object> get props => [createTransactionGetData];
}

class CreateTransactionFailed extends TransactionState {
  final String error;

  CreateTransactionFailed(this.error);

  @override
  List<Object> get props => [error];
}

class FetchPaymentMethodListSuccess extends TransactionState {
  final List<PaymentMethodModel> paymentMethodLis;

  FetchPaymentMethodListSuccess(this.paymentMethodLis);

  @override
  List<Object> get props => [paymentMethodLis];
}

class FetchPaymentMethodListFailed extends TransactionState {
  final String error;

  FetchPaymentMethodListFailed(this.error);

  @override
  List<Object> get props => [error];
}
