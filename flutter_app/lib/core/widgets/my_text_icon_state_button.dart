import 'package:flutter/material.dart';
import 'package:flutter_app/core/utils/constants/dimentions.dart';
import 'package:flutter_app/core/utils/constants/widget_properties.dart';
import 'package:flutter_app/core/widgets/my_beveled_container.dart';

class MyTextIconStateButton extends StatefulWidget {
  final String initialText;
  final IconData initialIcon;
  final IconData otherIcon;
  final VoidCallback onPressed;
  final String otherText;

  const MyTextIconStateButton({
    super.key,
    required this.initialText,
    required this.otherText,
    required this.initialIcon,
    required this.otherIcon,
    required this.onPressed,
  });

  @override
  _MyTextIconStateButtonState createState() => _MyTextIconStateButtonState();
}

class _MyTextIconStateButtonState extends State<MyTextIconStateButton> {
  bool _isActive = false; // State variable to track the button state

  void _toggleButton() {
    setState(() {
      _isActive = !_isActive; // Toggle the button state
    });
    widget.onPressed(); // Call the provided onPressed function
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: Dimentions.sizeXXL, // Minimum height for the button
        // minWidth: Dimentions.sizeXXL*3, // Minimum width for the button
      ),
      child: ElevatedButton(
        onPressed: _toggleButton,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: Dimentions.sizeXXL,
                  minWidth:
                      Dimentions.sizeXXL * 2, // Minimum width for the button
                ),
                child: MyBeveledContainer(
                    customColor: Theme.of(context).colorScheme.secondary,
                    // customColor: AppColors.orange.withOpacity(0.3),
                    // isBackGPrimary: true,
                    child: Center(
                        child: Text(
                      _isActive ? widget.otherText : widget.initialText,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Colors.white,
                            shadows: [
                              WidgetsProperties.lightBottomRightShadow(),
                            ]
                      ),
                    )))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimentions.sizeM),
              child: Icon(_isActive ? widget.otherIcon : widget.initialIcon, size: Dimentions.sizeXL),
            ),
          ],
        ),
      ),
    );
  }
}
