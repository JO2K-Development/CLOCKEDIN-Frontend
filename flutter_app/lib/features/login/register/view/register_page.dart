import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/theme/my_divider.dart';
import 'package:flutter_app/core/widgets/my_app_bar.dart';
import 'package:flutter_app/core/widgets/my_text_input.dart';
import 'package:flutter_app/core/widgets/plain_text_intput_decoration_wrapper.dart';
import 'package:flutter_app/core/widgets/white_beveled_container.dart';
import 'package:flutter_app/features/login/register/controller/register_provider.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        // title: Text('Register'),
      ),
      body: Consumer<RegisterProvider>(
      builder: (context, registerProvider, child) {
        return Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text("Rejestracja", style: Theme.of(context).textTheme.titleLarge,),
                )),
              SizedBox(height: 60),
              RegisterWidget(registerProvider),
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
    return PlainTextIntputDecorationWrapper(
      WhiteBeveledContainer(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  MyTextField(registerProvider.emailController, hintText: 'Email'),
                  MyDivider(indentPercent: 0.1),
                  SizedBox(height: 20),
                  MyTextField(registerProvider.passwordController, hintText: 'Hasło', obscureText: true),  
                  SizedBox(height: 20),
                  MyTextField(registerProvider.confirmPasswordController, hintText: 'Powtórz hasło', obscureText: true),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Register logic
                    },
                    child: Text('Register'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ), 
        ),
    );
  }
}