import 'package:flutter/material.dart';
import 'package:movies_and_series_app/features/login-register/view/widgets/login_section.dart';
import 'package:movies_and_series_app/features/login-register/view/widgets/register_section.dart';

class LoginRegisterPage extends StatelessWidget {
  const LoginRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Giriş Yap / Kayıt Ol'),
            bottom: const TabBar(tabs: [
              Tab(
                child: Text(
                  'Giriş Yap',
                  style: TextStyle(fontSize: 17),
                ),
              ),
              Tab(
                child: Text(
                  'Kayıt Ol',
                  style: TextStyle(fontSize: 17),
                ),
              )
            ]),
          ),
          body: const TabBarView(
            children: [LoginSection(), RegisterSection()],
          ),
        ));
  }
}
