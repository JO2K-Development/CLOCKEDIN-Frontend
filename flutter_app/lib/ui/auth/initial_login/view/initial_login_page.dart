import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/dimentions.dart';
import 'package:flutter_app/core/widgets/my_button_short.dart';
import 'package:flutter_app/core/widgets/my_divider.dart';
import 'package:flutter_app/core/widgets/google_logo_button.dart';
import 'package:flutter_app/core/widgets/my_app_bar.dart';
import 'package:flutter_app/core/widgets/my_text_input.dart';
import 'package:flutter_app/core/widgets/plain_text_intput_decoration_wrapper.dart';
import 'package:flutter_app/core/widgets/my_beveled_container.dart';
import 'package:flutter_app/routing/routes.dart';
import 'package:flutter_app/ui/auth/initial_login/view_model/initial_login_provider.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class InitialLoginPage extends StatelessWidget {

  const InitialLoginPage({super.key, required this.viewModel});
  
  final InitialLoginProvider viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        // title: 'Logowanie',
      ),
      body: Padding(
            padding: const EdgeInsets.all(Dimentions.sizeXL),
            child: Column(
              children: [
                Gap(Dimentions.sizeXL),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimentions.sizeL),
                    child: Text(AppLocalizations.of(context).login_title, style: Theme.of(context).textTheme.titleLarge,),
                  ),
                ),
                Gap( Dimentions.sizeXXL),
                PlainTextIntputDecorationWrapper(LoginWidget(viewModel)),
                Gap( Dimentions.sizeL),
                MyDivider(),
                Gap( Dimentions.sizeS),
                GoogleLogoButton(AppLocalizations.of(context).login_with_google),
                Gap( 100),
                GestureDetector(
                  onTap: () {
                    context.push(Routes.register);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(Dimentions.sizeM),
                    child: Text(AppLocalizations.of(context).login_register_option, style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).primaryColor)),
                  ),
                ),
              ],
            ),
          )
    );
  }
}

class LoginWidget extends StatelessWidget {
  final InitialLoginProvider viewModel;

  const LoginWidget(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel.login,
      builder: (context, child) {
        if (viewModel.login.completed){
          viewModel.login.clearResult();
          context.push(Routes.clockInOut);
        }

        return MyBeveledContainer(
                      radius: 40,
                      child: Column(
                        children: [
                          Gap( Dimentions.sizeL),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:Dimentions.sizeXXL),
                      child: MyTextField(viewModel.emailController, hintText: AppLocalizations.of(context).login_email_hint),
                    ),
                    MyDivider(),
                    Gap(Dimentions.sizeL),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:Dimentions.sizeXXL),
                      child: MyTextField(viewModel.passwordController, hintText: AppLocalizations.of(context).login_password_hint, obscureText: true),
                    ),
                    MyDivider(),
                    Gap(Dimentions.sizeS),
                    Align(
                      alignment: Alignment.centerRight,
                      child: viewModel.login.running
                      ?
                      CircularProgressIndicator()
                      :
                      Padding(
                        padding: const EdgeInsets.all(Dimentions.size6),
                        child: MyButtonShort(text:  AppLocalizations.of(context).login_button, onPressed: viewModel.login.execute,),
                      ),
                    ),
                    if (viewModel.errorMessage.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: Dimentions.sizeXL),
                        child: Text(viewModel.errorMessage),
                      ),
                      
                        ],
                      )
                    );
      }
    );
  }
}

