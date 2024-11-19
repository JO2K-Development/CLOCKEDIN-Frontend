import 'package:flutter/material.dart';

class GoogleLogoButton extends StatelessWidget {
  final String text;
  const GoogleLogoButton(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
          onPressed: () {
            // Add your onPressed code here
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.only(left: 20),
            textStyle: TextStyle(fontSize: 16),
          ),
          child: FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Adjust alignment as needed
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(text, style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).scaffoldBackgroundColor, 
                  fontWeight: FontWeight.normal,
                ),),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset(
                    'assets/images/logos/google-logo.png', // Change to your image path
                    width: 50, // Adjust the width as needed
                    // height: 24, // Adjust the height as needed
                  ),
                ),
              ],
            ),
          ),
        );
  }
}