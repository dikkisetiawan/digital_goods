import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neraca/cubit/neraca/neraca_operation_cubit.dart';
import 'package:neraca/cubit/notification_cubit.dart';
import 'package:neraca/ui/screens/neraca/detail_neraca_screen.dart';
import 'package:neraca/ui/screens/neraca/tambah_atau_revisi_neraca_screen.dart';
import 'cubit/neraca/neraca_cubit.dart';
import '/cubit/user_cubit.dart';
import '/ui/widgets/bottom_navigation_bar.dart';

import 'cubit/jenis_limbah/jenis_limbah_cubit.dart';
import '/ui/screens/dashboard_screen.dart';
import '/ui/screens/login/reset_password_success_screen.dart';
import '/ui/screens/profil_perusahaan_screen.dart';

import 'cubit/auth_cubit.dart';
import 'cubit/jenis_limbah/jenis_limbah_operation_cubit.dart';
import 'ui/screens/jenis_limbah/master_jenis_limbah_screen.dart';
import 'ui/screens/jenis_limbah/tambah_atau_edit_jenis_limbah_screen.dart';
import 'ui/screens/login/login_screen.dart';
import 'ui/screens/login/reset_password_screen.dart';
import 'ui/screens/neraca/neraca_list_screen.dart';

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
          create: (context) => UserCubit(),
        ),
        BlocProvider(
          create: (context) => JenisLimbahCubit(),
        ),
        BlocProvider(
          create: (context) => NeracaCubit(),
        ),
        BlocProvider(
          create: (context) => JenisLimbahOperationCubit(),
        ),
        BlocProvider(
          create: (context) => NeracaOperationCubit(),
        ),
        BlocProvider(
          create: (context) => NotificationCubit(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginScreen(),
          routes: {
            '/navigation': (context) => const MyBottomNavigationBar(),
            '/login': (context) => LoginScreen(),
            '/dashboard': (context) => const DashboardScreen(),
            '/reset-password': (context) => ResetPasswordScreen(),
            '/reset-password-success': (context) =>
                const ResetPasswordSuccessScreen(),
            '/profil-perusahaan': (context) => const ProfilPerusahaanScreen(),
            '/master-jenis-limbah': (context) =>
                const MasterJenisLimbahScreen(),
            TambahAtauEditJenisLimbahScreen.routeName: (context) =>
                TambahAtauEditJenisLimbahScreen(),
            NeracaListScreen.routeName: (context) => NeracaListScreen(),
            DetailNeracaScreen.routeName: (context) =>
                const DetailNeracaScreen(),
            TambahAtauRevisiNeracaScreen.routeName: (context) =>
                TambahAtauRevisiNeracaScreen(),
          }),
    );
  }
}
