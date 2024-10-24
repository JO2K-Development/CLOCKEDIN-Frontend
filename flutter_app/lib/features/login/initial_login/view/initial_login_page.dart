import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/theme/my_divider.dart';
import 'package:flutter_app/core/widgets/my_text_input.dart';
import 'package:flutter_app/core/widgets/plain_text_intput_decoration_wrapper.dart';
import 'package:flutter_app/core/widgets/white_beveled_container.dart';
import 'package:flutter_app/features/login/initial_login/controller/initial_login_provider.dart';
import 'package:provider/provider.dart';

class InitialLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Consumer<InitialLoginProvider>(
        builder: (context, initialLoginProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                SizedBox(height: 30),
                Text("Aby rozpocząć zaloguj się:", style: Theme.of(context).textTheme.titleLarge,),
                SizedBox(height: 60),
                PlainTextIntputDecorationWrapper(LoginWidget(initialLoginProvider)),
                SizedBox(height: 25),
                MyDivider(indentPercent: 0.2),
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
                  Column(
                    children: [
                      SizedBox(height: 30),
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
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: initialLoginProvider.isLoading ?
                  CircularProgressIndicator()
                  :
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      height: 70,
                      child: ElevatedButton(                        
                        onPressed: () {
                          initialLoginProvider.login();
                        },
                        child: Text('Zaloguj'),
                      ),
                    ),
                  ),
                ),
                if (initialLoginProvider.errorMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(initialLoginProvider.errorMessage),
                  )
                    ],
                  )
                );
  }
}