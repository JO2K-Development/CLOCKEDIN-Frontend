import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/dimentions.dart';
import 'package:flutter_app/core/widgets/google_logo_button.dart';
import 'package:flutter_app/core/widgets/my_button_short.dart';
import 'package:flutter_app/core/widgets/my_divider.dart';
import 'package:flutter_app/core/widgets/my_app_bar.dart';
import 'package:flutter_app/core/widgets/my_text_input.dart';
import 'package:flutter_app/core/widgets/plain_text_intput_decoration_wrapper.dart';
import 'package:flutter_app/core/widgets/my_beveled_container.dart';
import 'package:flutter_app/features/auth/register/controller/register_provider.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        // title: 'Register',
      ),
      body: Consumer<RegisterProvider>(
      builder: (context, registerProvider, child) {
        return Padding(
          padding: const EdgeInsets.all(Dimentions.sizeXL),
          child: Column(
            children: [
              Gap(Dimentions.sizeXL),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimentions.sizeL),
                  child: Text(AppLocalizations.of(context).register_title, style: Theme.of(context).textTheme.titleLarge,),
                )),
              Gap(Dimentions.sizeXXL),
              PlainTextIntputDecorationWrapper(RegisterWidget(registerProvider)),
              Gap(Dimentions.sizeL),
              MyButtonShort(text: AppLocalizations.of(context).register_button, onPressed: registerProvider.register),
              Gap(Dimentions.sizeXXL*2),
              Text(AppLocalizations.of(context).register_or_label, style: Theme.of(context).textTheme.bodyLarge,),
              // MyDivider(),
              Padding(
                padding: const EdgeInsets.all(Dimentions.sizeL),
                child: GoogleLogoButton(AppLocalizations.of(context).register_with_google),
              ),
            ],
          ),
        );
      
      }
    ));
  }
}

class RegisterWidget extends StatelessWidget {
  final RegisterProvider registerProvider;

  const RegisterWidget(this.registerProvider, {super.key});

  @override
  Widget build(BuildContext context) {
    return 
      MyBeveledContainer(

        child: Column(
          children: [
            Column(
              children: [
                Gap(Dimentions.sizeL),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimentions.sizeXXL),
                  child: MyTextField(registerProvider.emailController, hintText: AppLocalizations.of(context).register_email_hint),
                ),
                MyDivider(),
                Gap(Dimentions.sizeL),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimentions.sizeXXL),
                  child: MyTextField(registerProvider.passwordController, hintText: AppLocalizations.of(context).register_password_hint, obscureText: true),
                ),  
                MyDivider(),
                Gap(Dimentions.sizeL),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimentions.sizeXXL),
                  child: MyTextField(registerProvider.confirmPasswordController, hintText: AppLocalizations.of(context).register_confirm_password_hint, obscureText: true),
                ),
                
              ],
            ),
            Gap(Dimentions.sizeM),
            
          ],
        ), 
        
    );
  }
}