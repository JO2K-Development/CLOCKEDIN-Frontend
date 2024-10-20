import 'package:flutter/material.dart';

class InitialLoginPage extends StatefulWidget {
  const InitialLoginPage({super.key});
  
  @override
  State<InitialLoginPage> createState() => _InitialLoginPageState();
}

class _InitialLoginPageState extends State<InitialLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Initial Login Page'),
      color: Colors.white,
    );
  }
}