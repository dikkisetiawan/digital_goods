import 'package:digital_goods/cubit/digital_goods_cubit.dart';
import 'package:digital_goods/cubit/digital_goods_query_cubit.dart';
import 'package:digital_goods/cubit/transaction_cubit.dart';
import 'package:digital_goods/ui/screens/kode_pembyaran_screen.dart';
import 'package:digital_goods/ui/screens/metode_pembayaran_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/auth_cubit.dart';
import 'ui/screens/home_screen.dart';
import 'ui/screens/login_screen.dart';
import 'ui/screens/pulsa_dan_data_screen.dart';
import 'ui/screens/tagihan_dan_hiburan_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => DigitalGoodsCubit(),
        ),
        BlocProvider(
          create: (context) => DigitalGoodsQueryCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const LoginScreen(),
          routes: {
            '/homescreen': (context) => const HomeScreen(),
            '/tagihan-dan-hiburan': (context) =>
                const TagihanDanHiburanScreen(),
            '/pulsa-data': (context) => const PulsaDanDataScreen(),
            '/metode-pembayaran': (context) => const MetodePembayaranScreen(),
            '/kode-pembayaran': (context) => const KodePembayaranScreen(),
          }),
    );
  }
}
