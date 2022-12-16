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
          const KtextFormField(title: 'Email atau No. HP'),
          const SizedBox(
            height: defaultMargin,
          ),
          const KtextFormField(
            title: 'Password',
            icon: Icons.visibility,
          ),
          rememberAndForgetPasswordWidget(),
          const SizedBox(
            height: defaultMargin * 2,
          ),
          KelevatedButton(onPressed: () {}, title: 'Masuk'),
          const SizedBox(
            height: defaultMargin,
          ),
          Text(
            'Atau Masuk dengan',
            style: greyTextStyle.copyWith(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          iconButtonsWidget(),
          const SizedBox(
            height: defaultMargin,
          ),
          Row(
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
          )
        ],
      ),
    );
  }

  Row iconButtonsWidget() {
    return Row(
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
