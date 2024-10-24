import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  const MyTextField(this.controller, {this.hintText = '', this.obscureText = false, super.key});
  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      
      maxLength: 50,
      controller: widget.controller,
      focusNode: _focusNode,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        hintText: _isFocused ? null : widget.hintText, // Change hint text based on focus
        // hintStyle: TextStyle(color: Colors.grey),
        // border: InputBorder.none,
        // enabledBorder: InputBorder.none,
        // focusedBorder: InputBorder.none,
        // errorBorder: InputBorder.none,
        // disabledBorder: InputBorder.none,
    //     enabledBorder: OutlineInputBorder(
    //   borderSide: BorderSide(color: Colors.blue), // Border color when not focused
    // ),
        counterText: '',
        // contentPadding: EdgeInsets.all(10),
      ),
    );
  }
}
