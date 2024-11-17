import 'package:flutter/material.dart';

class WidgetsProperties {
  static const borderRadius = BorderRadius.all(Radius.circular(40.0));

  static WidgetStateProperty<BorderSide> makeElevatedButtonBorderSide({required Color color}){
    return WidgetStateProperty.all<BorderSide>(
        BorderSide(color: color, width: 3.0, style: BorderStyle.solid),
      );
  }
  static dynamic lightBottomRightShadow = () => Shadow(
        offset: Offset(2.0, 2.0), // Horizontal and vertical offset
        blurRadius: 10.0,           // How blurry the shadow should be
        color: Colors.black.withOpacity(0.8), // Shadow color with transparency
      );
  static dynamic lightTopLeftShadow = () => Shadow(
        offset: Offset(-2.0, -2.0), // Horizontal and vertical offset
        blurRadius: 10.0,           // How blurry the shadow should be
        color: Colors.black.withOpacity(0.8), // Shadow color with transparency
      );

  static dynamic broadBottomRightShadow = () => Shadow(
        offset: Offset(2.0, 2.0), // Horizontal and vertical offset
        blurRadius: 30.0,           // How blurry the shadow should be
        color: Colors.black.withOpacity(0.8), // Shadow color with transparency
      );
  static dynamic broadTopLeftShadow = () => Shadow(
        offset: Offset(-2.0, -2.0), // Horizontal and vertical offset
        blurRadius: 30.0,           // How blurry the shadow should be
        color: Colors.black.withOpacity(0.8), // Shadow color with transparency
      );
}