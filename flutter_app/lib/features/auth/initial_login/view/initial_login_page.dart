import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/dimentions.dart';
import 'package:flutter_app/core/widgets/my_button_short.dart';
import 'package:flutter_app/core/widgets/my_divider.dart';
import 'package:flutter_app/core/widgets/google_logo_button.dart';
import 'package:flutter_app/core/widgets/my_app_bar.dart';
import 'package:flutter_app/core/widgets/my_text_input.dart';
import 'package:flutter_app/core/widgets/plain_text_intput_decoration_wrapper.dart';
import 'package:flutter_app/core/widgets/my_beveled_container.dart';
import 'package:flutter_app/features/auth/initial_login/controller/initial_login_provider.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:provider/provider.dart';

class InitialLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        // title: 'Logowanie',
      ),
      body: Consumer<InitialLoginProvider>(
        builder: (context, initialLoginProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(Dimentions.sizeXL),
            child: Column(
              children: [
                Gap(Dimentions.sizeXL),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimentions.sizeL),
                  child: Text("Aby rozpocząć zaloguj się:", style: Theme.of(context).textTheme.titleLarge,),
                ),
                Gap( Dimentions.sizeXXL),
                PlainTextIntputDecorationWrapper(LoginWidget(initialLoginProvider)),
                Gap( Dimentions.sizeL),
                MyDivider(),
                Gap( Dimentions.sizeS),
                GoogleLogoButton("Zaloguj przez Google"),
                Gap( 100),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(Dimentions.sizeM),
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
    return MyBeveledContainer(
                  radius: 40,
                  child: Column(
                    children: [
                      Gap( Dimentions.sizeL),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:Dimentions.sizeXXL),
                  child: MyTextField(initialLoginProvider.emailController, hintText: "Email"),
                ),
                MyDivider(),
                Gap(Dimentions.sizeL),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:Dimentions.sizeXXL),
                  child: MyTextField(initialLoginProvider.passwordController, hintText: "Hasło", obscureText: true),
                ),
                MyDivider(),
                Gap(Dimentions.sizeS),
                Align(
                  alignment: Alignment.centerRight,
                  child: initialLoginProvider.isLoading ?
                  CircularProgressIndicator()
                  :
                  Padding(
                    padding: const EdgeInsets.all(Dimentions.size6),
                    child: MyButtonShort(text: "Zaloguj", onPressed: initialLoginProvider.login,),
                  ),
                ),
                if (initialLoginProvider.errorMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: Dimentions.sizeXL),
                    child: Text(initialLoginProvider.errorMessage),
                  ),
                  
                    ],
                  )
                );
  }
}
