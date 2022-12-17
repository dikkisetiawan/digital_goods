import 'package:bloc/bloc.dart';
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

  void createTransaction() async {
    try {
      emit(TransactionLoading());

      print('lastDataCreatedTransaction $lastDataCreatedTransaction');

      CreateTransactionModel createTransactionGetData =
          await TransactionService().createTransaction(
              createTransactionData: lastDataCreatedTransaction!,
              token: AuthCubit.loginData!.accessToken!);

      print('createTransactionGetData $createTransactionGetData');

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
