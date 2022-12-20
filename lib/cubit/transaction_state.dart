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

  const CreateTransactionSuccess(this.createTransactionGetData);

  @override
  List<Object> get props => [createTransactionGetData];
}

class CreateTransactionFailed extends TransactionState {
  final String error;

  const CreateTransactionFailed(this.error);

  @override
  List<Object> get props => [error];
}

class GeneratePaymentCodeSuccess extends TransactionState {
  final GeneratePaymentCodeModel generatedPaymentCode;

  const GeneratePaymentCodeSuccess(this.generatedPaymentCode);

  @override
  List<Object> get props => [generatedPaymentCode];
}

class GeneratePaymentCodeFailed extends TransactionState {
  final String error;

  const GeneratePaymentCodeFailed(this.error);

  @override
  List<Object> get props => [error];
}

class FetchPaymentMethodListSuccess extends TransactionState {
  final List<PaymentMethodModel> paymentMethodList;

  const FetchPaymentMethodListSuccess(this.paymentMethodList);

  @override
  List<Object> get props => [paymentMethodList];
}

class FetchPaymentMethodListFailed extends TransactionState {
  final String error;

  const FetchPaymentMethodListFailed(this.error);

  @override
  List<Object> get props => [error];
}
