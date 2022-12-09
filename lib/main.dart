import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/ui/widgets/bottom_navigation_bar.dart';
import 'ui/screens/home_screen.dart';
import 'ui/screens/pulsa_dan_data_screen.dart';
import 'ui/screens/tagihan_dan_hiburan_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PulsaDanDataScreen(),
        routes: {
          // '/navigation': (context) => const MyBottomNavigationBar(),
          // '/login': (context) => LoginScreen(),
          // '/dashboard': (context) => const DashboardScreen(),
          // '/reset-password': (context) => ResetPasswordScreen(),
          // '/reset-password-success': (context) =>
          //     const ResetPasswordSuccessScreen(),
          // '/profil-perusahaan': (context) => const ProfilPerusahaanScreen(),
          // '/master-jenis-limbah': (context) =>
          //     const MasterJenisLimbahScreen(),
          // TambahAtauEditJenisLimbahScreen.routeName: (context) =>
          //     TambahAtauEditJenisLimbahScreen(),
          // NeracaListScreen.routeName: (context) => NeracaListScreen(),
          // DetailNeracaScreen.routeName: (context) =>
          //     const DetailNeracaScreen(),
          // TambahAtauRevisiNeracaScreen.routeName: (context) =>
          //     TambahAtauRevisiNeracaScreen(),
        });
  }
}
