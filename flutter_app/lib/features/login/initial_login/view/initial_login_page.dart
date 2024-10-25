import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/theme/my_divider.dart';
import 'package:flutter_app/core/widgets/google_logo_button.dart';
import 'package:flutter_app/core/widgets/my_app_bar.dart';
import 'package:flutter_app/core/widgets/my_text_input.dart';
import 'package:flutter_app/core/widgets/plain_text_intput_decoration_wrapper.dart';
import 'package:flutter_app/core/widgets/white_beveled_container.dart';
import 'package:flutter_app/features/login/initial_login/controller/initial_login_provider.dart';
import 'package:provider/provider.dart';

class InitialLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        // title: Text('Login'),
      ),
      body: Consumer<InitialLoginProvider>(
        builder: (context, initialLoginProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text("Aby rozpocząć zaloguj się:", style: Theme.of(context).textTheme.titleLarge,),
                ),
                SizedBox(height: 60),
                PlainTextIntputDecorationWrapper(LoginWidget(initialLoginProvider)),
                SizedBox(height: 30),
                MyDivider(indentPercent: 0.2),
                SizedBox(height: 10),
                GoogleLogoButton("Zaloguj przez Google"),
                SizedBox(height: 100),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("lub załóż konto", style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).primaryColor)),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class LoginWidget extends StatelessWidget {
  final InitialLoginProvider initialLoginProvider;
  const LoginWidget(this.initialLoginProvider, {super.key});

  @override
  Widget build(BuildContext context) {
    return WhiteBeveledContainer(
                  radius: 40,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:45.0),
                  child: MyTextField(initialLoginProvider.emailController, hintText: "Email"),
                ),
                MyDivider(indentPercent: 0.2),
                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:45.0),
                  child: MyTextField(initialLoginProvider.passwordController, hintText: "Hasło", obscureText: true),
                ),
                MyDivider(indentPercent: 0.2),
                SizedBox(height: 7),
                Align(
                  alignment: Alignment.centerRight,
                  child: initialLoginProvider.isLoading ?
                  CircularProgressIndicator()
                  :
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: 55,
                      child: ElevatedButton(                              
                        onPressed: () {
                          initialLoginProvider.login();
                        },
                        child: Text('Zaloguj', style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).scaffoldBackgroundColor, 
                          fontWeight: FontWeight.normal,
                          )
                        ),
                      ),
                    ),
                  ),
                ),
                if (initialLoginProvider.errorMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(initialLoginProvider.errorMessage),
                  ),
                  
                    ],
                  )
                );
  }
}

