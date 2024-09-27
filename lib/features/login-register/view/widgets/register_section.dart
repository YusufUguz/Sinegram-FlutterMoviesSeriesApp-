// ignore_for_file: use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_and_series_app/features/login-register/view/login_register_page.dart';
import 'package:movies_and_series_app/features/login-register/view_model/login_register_view_model.dart';
import 'package:movies_and_series_app/features/login-register/view_model/register_mixin.dart';
import 'package:movies_and_series_app/core/general_widgets/custom_button.dart';
import 'package:movies_and_series_app/core/general_widgets/custom_checkbox.dart';
import 'package:movies_and_series_app/core/general_widgets/custom_textformfield.dart';

class RegisterSection extends StatefulWidget {
  const RegisterSection({super.key});
  @override
  State<RegisterSection> createState() => _RegisterSectionState();
}

class _RegisterSectionState extends State<RegisterSection>
    with SingleTickerProviderStateMixin, RegisterMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                        validator: (value) {
                          checkUsernameAvailability(usernameController.text);
                          if (value!.isEmpty) {
                            return 'Kullanıcı Adınızı Giriniz.';
                          } else if (errorTextForUsername ==
                              'Bu kullanıcı adı zaten kullanımda.') {
                            return 'Bu kullanıcı adı zaten kullanımda.';
                          }
                          return null;
                        },
                        textEditingController: usernameController,
                        icon: FontAwesomeIcons.user,
                        labelText: "Kullanıcı Adı"),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                        validator: (value) {
                          checkEmailAvailability(emailController.text);
                          const pattern =
                              r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
                          final regExp = RegExp(pattern);
                          if (value!.isEmpty) {
                            return 'E-Posta Giriniz';
                          } else if (!regExp.hasMatch(value)) {
                            return '@ ve .com bulunduran E-Posta Giriniz.';
                          } else if (errorTextForEmail ==
                              'Bu e-posta zaten kullanımda.') {
                            return 'Bu e-posta zaten kullanımda.';
                          }
                          return null;
                        },
                        textEditingController: emailController,
                        icon: FontAwesomeIcons.envelope,
                        labelText: "E-Posta"),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                        obsecureText: true,
                        validator: (value) {
                          const pattern =
                              r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&.])[A-Za-z\d@$!%*?&.]{8,}$';
                          final regExp = RegExp(pattern);

                          if (value!.isEmpty) {
                            return 'Şifrenizi Giriniz.';
                          } else if (!regExp.hasMatch(value)) {
                            return 'Şifreniz en az 1 büyük,1 küçük,1 özel karakter içermeli ve en az 8 haneli olmalıdır.';
                          }
                          return null;
                        },
                        textEditingController: passwordController,
                        icon: FontAwesomeIcons.lock,
                        labelText: "Şifre"),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                        obsecureText: true,
                        validator: (value) {
                          if (value != passwordController.text) {
                            return "Şifreler uyuşmuyor";
                          }
                          return null;
                        },
                        textEditingController: passwordAgainController,
                        icon: FontAwesomeIcons.lock,
                        labelText: "Şifre Tekrar"),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 25),
                      child: CustomCheckBox(),
                    ),
                    CustomButton(
                      text: "Kayıt Ol",
                      onPressed: () async {
                        final isValid = formKey.currentState?.validate();
                        if (isValid!) {
                          formKey.currentState?.save();
                          try {
                            await LoginregisterViewModel().register(
                                context,
                                usernameController,
                                emailController,
                                passwordController);

                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text(
                                  "Kayıt Başarılı.",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                content: const Text(
                                  "Kaydınız başarıyla tamamlandı.Giriş Sayfasına yönlendiriliyorsunuz.",
                                  style: TextStyle(
                                      fontFamily: 'Blogger_Sans', fontSize: 18),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(builder: (context) {
                                        return const LoginRegisterPage();
                                      }));
                                    },
                                    child: const Text(
                                      "Tamam",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } on FirebaseAuthException catch (e) {
                            debugPrint(e.toString());
                          }
                        }
                        /* if (isValid == false) {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text(
                                "Bilgileriniz Yanlış!",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              content: const Text(
                                "Bilgileri doğru girdiğinizden emin olunuz.",
                                style: TextStyle(
                                    fontFamily: 'Blogger_Sans', fontSize: 18),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  child: const Text(
                                    "Tamam",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } */
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
