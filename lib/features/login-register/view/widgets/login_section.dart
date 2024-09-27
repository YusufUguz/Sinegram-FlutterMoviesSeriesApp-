import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_and_series_app/features/login-register/view_model/login_register_view_model.dart';
import 'package:movies_and_series_app/core/general_widgets/custom_button.dart';
import 'package:movies_and_series_app/core/general_widgets/custom_textformfield.dart';

class LoginSection extends StatefulWidget {
  const LoginSection({super.key});

  @override
  State<LoginSection> createState() => _LoginSectionState();
}

class _LoginSectionState extends State<LoginSection> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logo4clipped.png",
                    height: 150,
                  ),
                  CustomTextFormField(
                    textEditingController: _emailController,
                    icon: FontAwesomeIcons.envelope,
                    labelText: "E-Posta",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    obsecureText: true,
                    textEditingController: _passwordController,
                    icon: FontAwesomeIcons.lock,
                    labelText: "Şifre",
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    text: "Giriş Yap",
                    onPressed: () {
                      LoginregisterViewModel().authenticate(
                          context, _emailController, _passwordController);
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Şifremi Unuttum"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void errorMessage(String text) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      textColor: Colors.white,
      fontSize: 14);
}
