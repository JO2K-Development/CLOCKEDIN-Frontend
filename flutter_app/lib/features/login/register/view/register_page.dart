import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/dimentions.dart';
import 'package:flutter_app/core/widgets/google_logo_button.dart';
import 'package:flutter_app/core/widgets/my_divider.dart';
import 'package:flutter_app/core/widgets/my_app_bar.dart';
import 'package:flutter_app/core/widgets/my_text_input.dart';
import 'package:flutter_app/core/widgets/plain_text_intput_decoration_wrapper.dart';
import 'package:flutter_app/core/widgets/white_beveled_container.dart';
import 'package:flutter_app/features/login/register/controller/register_provider.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:provider/provider.dart';

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
                  child: Text("Rejestracja", style: Theme.of(context).textTheme.titleLarge,),
                )),
              Gap(Dimentions.sizeXXL),
              PlainTextIntputDecorationWrapper(RegisterWidget(registerProvider)),
              Gap(Dimentions.sizeL),
              SizedBox(
                height: Dimentions.buttonSize,
                child: ElevatedButton(
                    onPressed: () {
                      // Register logic
                    },
                    child: Text('Zarejestruj się'),
                  ),
              ),
              Gap(Dimentions.sizeXXL*2),
              Text("lub", style: Theme.of(context).textTheme.bodyLarge,),
              // MyDivider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GoogleLogoButton("Zarejestruj przez Google"),
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
      WhiteBeveledContainer(

        child: Column(
          children: [
            Column(
              children: [
                Gap(Dimentions.sizeL),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimentions.sizeXXL),
                  child: MyTextField(registerProvider.emailController, hintText: 'Email'),
                ),
                MyDivider(),
                Gap(Dimentions.sizeL),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimentions.sizeXXL),
                  child: MyTextField(registerProvider.passwordController, hintText: 'Hasło', obscureText: true),
                ),  
                MyDivider(),
                Gap(Dimentions.sizeL),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimentions.sizeXXL),
                  child: MyTextField(registerProvider.confirmPasswordController, hintText: 'Powtórz hasło', obscureText: true),
                ),
                
              ],
            ),
            Gap(Dimentions.sizeM),
            
          ],
        ), 
        
    );
  }
}