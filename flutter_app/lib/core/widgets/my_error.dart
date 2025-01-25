import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key, required this.title, this.message});
  
  final String? message;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(title),
          Text(message ?? ''),
        ],
      ),
    );
  }
}