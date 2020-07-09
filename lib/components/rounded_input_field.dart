import 'package:flutter/material.dart';
import 'package:student_coloco_ghoulami/components/text_field_container.dart';
import '../util/constants.dart';

class RoundedInputField extends StatefulWidget {
  const RoundedInputField({
    this.fieldKey,
    this.maxLength,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onChanged,
    this.validator,
    this.onFieldSubmitted, this.keyboardType,
  });

  final Key fieldKey;
  final int maxLength;
  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onChanged;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;
  final TextInputType keyboardType;


  @override
  _RoundedInputFieldState createState() => _RoundedInputFieldState(hintText);
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  final String hintText;

  _RoundedInputFieldState(this.hintText);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        key: widget.fieldKey,
        onChanged: widget.onChanged,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          icon: Icon(
            Icons.person,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

