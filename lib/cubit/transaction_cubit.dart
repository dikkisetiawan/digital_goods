// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import '/models/generate_payment_code_model.dart';
import '/cubit/auth_cubit.dart';
import '/models/payment_method_model.dart';

import '/models/transaction_model.dart';
import '/services/transaction_service.dart';
import 'package:equatable/equatable.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  static String? destination;
  static CreateTransactionModel? lastDataCreatedTransaction;

  final String token = AuthCubit.loginData!.accessToken!;
  late CreateTransactionModel createTransactionGetData;
  late int lastPaymentMethodIdSelected;

  void setPaymentMethodId(int paymentMethodId) {
    lastPaymentMethodIdSelected = paymentMethodId;
    print('last payment method is $lastPaymentMethodIdSelected');
  }

  void createTransaction() async {
    try {
      emit(TransactionLoading());

      createTransactionGetData = await TransactionService().createTransaction(
          createTransactionData: lastDataCreatedTransaction!, token: token);

      emit(CreateTransactionSuccess(createTransactionGetData));
    } catch (e) {
      emit(CreateTransactionFailed(e.toString()));
    }
  }

  void generatePaymentCode() async {
    try {
      emit(TransactionLoading());

      GeneratePaymentCodeModel generatedPaymentCode = await TransactionService()
          .generatePaymentCode(
              token: token,
              transactionId: createTransactionGetData.id!,
              paymentMethodId: lastPaymentMethodIdSelected);

      emit(GeneratePaymentCodeSuccess(generatedPaymentCode));
    } catch (e) {
      emit(GeneratePaymentCodeFailed(e.toString()));
    }
  }

  void fetchPaymentMethodList() async {
    try {
      emit(TransactionLoading());

      List<PaymentMethodModel> paymentMethodList =
          await TransactionService().fetchPaymentMethodList(token: token);

      emit(FetchPaymentMethodListSuccess(paymentMethodList));
    } catch (e) {
      emit(FetchPaymentMethodListFailed(e.toString()));
    }
  }

  void fetchTransactionList() async {
    try {
      emit(TransactionLoading());

      TransactionListModel transactionList =
          await TransactionService().fetchTransactionList(token: token);

      emit(FetchTransactionListSuccess(transactionList));
    } catch (e) {
      emit(FetchTransactionListFailed(e.toString()));
    }
  }
}
