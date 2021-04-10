import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final TextEditingController controller;

  const PasswordInput({Key key, this.controller}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PasswordInputState();
  }
}

class PasswordInputState extends State<PasswordInput> {
  bool isObscureText = true;
  TextEditingController _controller;

  @override
  void initState() {
    _controller = widget.controller;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      obscureText: isObscureText,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        hintText: 'Contraseña',
        contentPadding: EdgeInsets.all(26),
        prefixIcon: Icon(
          Icons.lock_outlined,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            (isObscureText) ? Icons.visibility_outlined : Icons.visibility_off,
            size: 20,
          ),
          onPressed: () {
            isObscureText = !isObscureText;
            setState(() {});
          },
        ),
      ),
    );
  }
}
