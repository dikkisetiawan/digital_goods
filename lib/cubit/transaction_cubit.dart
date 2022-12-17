import 'package:bloc/bloc.dart';
import 'package:digital_goods/cubit/auth_cubit.dart';
import 'package:digital_goods/models/payment_method_model.dart';

import '/models/transaction_model.dart';
import '/services/transaction_service.dart';
import 'package:equatable/equatable.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  static String? destination;
  static CreateTransactionModel? lastDataCreatedTransaction;

  void createTransaction() async {
    try {
      emit(TransactionLoading());

      CreateTransactionModel createTransactionGetData =
          await TransactionService().createTransaction(
              createTransactionData: lastDataCreatedTransaction!);

      emit(CreateTransactionSuccess(createTransactionGetData));
    } catch (e) {
      emit(CreateTransactionFailed(e.toString()));
    }
  }

  void fetchPaymentMethodList() async {
    try {
      emit(TransactionLoading());

      List<PaymentMethodModel> paymentMethodList = await TransactionService()
          .fetchPaymentMethodList(token: AuthCubit.loginData!.accessToken!);

      emit(FetchPaymentMethodListSuccess(paymentMethodList));
    } catch (e) {
      emit(FetchPaymentMethodListFailed(e.toString()));
    }
  }
}
