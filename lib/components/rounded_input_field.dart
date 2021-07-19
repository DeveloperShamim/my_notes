import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_notes/components/text_field_container.dart';
import 'package:my_notes/shared/constants.dart';

class RoundedInputField extends StatelessWidget {
  final ValueChanged<String> validator;
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    this.validator,
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: validator,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          labelText: hintText,
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
