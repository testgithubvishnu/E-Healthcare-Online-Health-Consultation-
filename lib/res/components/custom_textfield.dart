import 'package:e_healthcare_application/consts/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final Color textColor;
  final TextEditingController? textcontroller;
  final dynamic borderColor;
  final Color inputColor;
  const CustomTextField(
      {super.key,
      required this.hint,
      this.textcontroller,
      this.inputColor=Colors.black,
      required String? Function(dynamic value) validator, 
      this.textColor = Colors.black12,
      this.borderColor = Colors.black});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textcontroller,
      cursorColor: AppColors.blueColor,
      style: TextStyle(color:widget.inputColor ),
      decoration: InputDecoration(
          isDense: true,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: widget.borderColor,
          )),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: widget.borderColor,
          )),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor)),
          hintText: widget.hint,
          hintStyle: TextStyle(color: widget.textColor)),
    );
  }
}
