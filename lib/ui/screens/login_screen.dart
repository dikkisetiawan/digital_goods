import '/cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/ui/theme.dart';
import '/ui/widgets/grey_container_widget.dart';
import '/ui/widgets/kelevated_button.dart';
import '/ui/widgets/ktext_form_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
            top: defaultMargin * 6,
            left: defaultMargin,
            right: defaultMargin,
            bottom: defaultMargin * 4),
        children: [
          Text(
            'Selamat Datang \ndi Project Jakarta',
            style: blackTextStyle.copyWith(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: defaultMargin * 2,
          ),
          Text(
            'Email atau No. HP',
            style: blackTextStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          const KtextFormField(
              withTitle: false, title: 'digital1234@gmail.com'),
          const SizedBox(
            height: defaultMargin,
          ),
          Text(
            'Password',
            style: blackTextStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          const KtextFormField(
            withTitle: false,
            title: 'digital1234',
            icon: Icons.visibility,
          ),
          rememberAndForgetPasswordWidget(),
          const SizedBox(
            height: defaultMargin * 2,
          ),
          loginButtonWidget(),
          const SizedBox(
            height: defaultMargin,
          ),
          iconButtonsWidget(),
          const SizedBox(
            height: defaultMargin,
          ),
          registerButtonWidget()
        ],
      ),
    );
  }

  Row registerButtonWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Belum punya akun?',
          style: blackTextStyle.copyWith(fontWeight: FontWeight.normal),
        ),
        TextButton(
          onPressed: () {},
          child: Text('Daftar disini',
              style: buttonTextStyle.copyWith(
                decoration: TextDecoration.underline,
              )),
        )
      ],
    );
  }

  BlocConsumer<AuthCubit, AuthState> loginButtonWidget() {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          context.read<AuthCubit>().fetchUserProfile();
        } else if (state is AuthFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: kDangerColor,
              content: Text(
                state.error,
                style: whiteTextStyle,
              ),
            ),
          );
        } else if (state is FetchUserProfileSuccess) {
          Navigator.pushReplacementNamed(context, '/tagihan-dan-hiburan');
        } else if (state is FetchUserProfileFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: kDangerColor,
              content: Text(
                state.error,
                style: whiteTextStyle,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: kPrimaryColor,
            ),
          );
        }
        return KelevatedButton(
            onPressed: () {
              context.read<AuthCubit>().login(
                  email: 'digital1234@gmail.com', password: 'digital1234');
            },
            title: 'Masuk');
      },
    );
  }

  Column iconButtonsWidget() {
    return Column(
      children: [
        Text(
          'Atau Masuk dengan',
          style: greyTextStyle.copyWith(fontSize: 16),
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {},
              child: GreyContainerWidget(
                  width: 100, child: Image.asset('assets/google.png')),
            ),
            GestureDetector(
              onTap: () {},
              child: GreyContainerWidget(
                  width: 100, child: Image.asset('assets/apple.png')),
            ),
          ],
        ),
      ],
    );
  }

  Row rememberAndForgetPasswordWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: false,
              onChanged: (value) {},
            ),
            Text(
              'Ingat saya',
              style: blackTextStyle.copyWith(fontWeight: FontWeight.normal),
            ),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: Text('Lupa Password',
              style: buttonTextStyle.copyWith(
                decoration: TextDecoration.underline,
              )),
        )
      ],
    );
  }
}
