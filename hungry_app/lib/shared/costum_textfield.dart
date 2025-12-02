import 'package:flutter/material.dart';

class CostumTextfield extends StatefulWidget {
  const CostumTextfield({
    super.key,
    required this.hint,
    required this.ispassword,
    required this.controller,
  });

  final String hint;
  final bool ispassword;
  final TextEditingController controller;

  @override
  State<CostumTextfield> createState() => _CostumTextfieldState();
}

class _CostumTextfieldState extends State<CostumTextfield> {
  late bool _obscureText;

  @override
  void initState() {
    _obscureText = widget.ispassword;
    super.initState();
  }

  void toggelPassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText, // تخفي في رمز
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Plase fill ${widget.hint}";
        }
        null;
      },
      decoration: InputDecoration(
        suffixIcon: widget.ispassword
            ? GestureDetector(
                onTap: toggelPassword,
                child: Icon(Icons.remove_red_eye),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: widget.hint,
        fillColor: Colors.white, // للون مش ح تيغر الا بعد تليه true
        filled: true,
      ),
    );
  }
}
