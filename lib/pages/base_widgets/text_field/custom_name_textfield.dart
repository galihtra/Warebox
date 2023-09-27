import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/custom_themes.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

class CustomNameTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? textInputType;
  final int? maxLine;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final TextInputAction? textInputAction;
  final bool isPhoneNumber;
  final bool isValidator;
  final String? validatorMessage;
  final Color? fillColor;
  final TextCapitalization capitalization;
  final bool isBorder;
  final TextAlign? textAlign;
  final bool isEnable;
  final Icon? prefixIcon;

  const CustomNameTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.textInputType,
    this.maxLine,
    this.focusNode,
    this.nextNode,
    this.textInputAction,
    this.isPhoneNumber = false,
    this.isValidator = false,
    this.validatorMessage,
    this.capitalization = TextCapitalization.none,
    this.fillColor,
    this.isBorder = false,
    this.textAlign,
    this.isEnable = true,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: isBorder
            ? Border.all(width: .8, color: Theme.of(context).hintColor)
            : null,
        color: Theme.of(context).highlightColor,
        borderRadius: isPhoneNumber
            ? const BorderRadius.only(
                topRight: Radius.circular(12), bottomRight: Radius.circular(12))
            : BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
              color: Colors.transparent,
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 1)) // changes position of shadow
        ],
      ),
      child: TextFormField(
        textAlign: textAlign != null
            ? textAlign!
            : isBorder
                ? TextAlign.center
                : TextAlign.start,
        controller: controller,
        maxLines: maxLine ?? 1,
        textCapitalization: capitalization,
        maxLength: isPhoneNumber ? 15 : null,
        focusNode: focusNode,
        keyboardType: textInputType ?? TextInputType.text,
        //keyboardType: TextInputType.number,
        enabled: isEnable,
        initialValue: null,
        textInputAction: textInputAction ?? TextInputAction.next,
        onFieldSubmitted: (v) {
          FocusScope.of(context).requestFocus(nextNode);
        },
        //autovalidate: true,
        inputFormatters: [
          isPhoneNumber
              ? FilteringTextInputFormatter.digitsOnly
              : FilteringTextInputFormatter.singleLineFormatter
        ],
        validator: (input) {
          if (input!.isEmpty) {
            if (isValidator) {
              return validatorMessage ?? "";
            }
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: hintText ?? '',
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
          isDense: true,
          counterText: '',
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFF2E9496),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          hintStyle: pjsSemiBold16.copyWith(color: Theme.of(context).hintColor),
          errorStyle: const TextStyle(height: 1.5),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0x00000000),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          prefixIcon: const Icon(
            Icons.person_2_outlined,
            color: Colors.black,
            size: 22,
          ),
        ),
      ),
    );
  }
}
