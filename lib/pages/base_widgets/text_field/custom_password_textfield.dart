import 'package:flutter/material.dart';
import 'package:warebox/utils/warebox_icon_icons.dart';
import '../../../utils/custom_themes.dart';

class CustomPasswordTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintTxt;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final TextInputAction? textInputAction;
  final TextAlign? textAlign;
  final bool isBorder;
  final Icon? prefixIcon;

  const CustomPasswordTextField({
    Key? key,
    this.controller,
    this.hintTxt,
    this.focusNode,
    this.nextNode,
    this.textInputAction,
    this.textAlign,
    this.isBorder = false,
    this.prefixIcon,
  }) : super(key: key);

  @override
  CustomPasswordTextFieldState createState() => CustomPasswordTextFieldState();
}

class CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: widget.isBorder
            ? Border.all(width: .8, color: Theme.of(context).hintColor)
            : null,
        color: Theme.of(context).highlightColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.transparent,
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1),
          ), // changes position of shadow
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: TextFormField(
          textAlign: widget.textAlign != null
              ? widget.textAlign!
              : widget.isBorder
                  ? TextAlign.center
                  : TextAlign.start,
          cursorColor: Theme.of(context).primaryColor,
          controller: widget.controller,
          obscureText: _obscureText,
          focusNode: widget.focusNode,
          textInputAction: widget.textInputAction ?? TextInputAction.next,
          onFieldSubmitted: (v) {
            setState(() {
              widget.textInputAction == TextInputAction.done
                  ? FocusScope.of(context).consumeKeyboardToken()
                  : FocusScope.of(context).requestFocus(widget.nextNode);
            });
          },
          validator: (value) {
            return null;
          },
          decoration: InputDecoration(
              prefixIcon: const Icon(
                WareboxIcon.lock,
                color: Colors.black,
                size: 20,
              ),
              suffixIcon: IconButton(
                  icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility),
                  onPressed: _toggle),
              hintText: widget.hintTxt ?? '',
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
              isDense: true,
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFF2E9496),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0x00000000),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              hintStyle:
                  pjsSemiBold16.copyWith(color: Theme.of(context).hintColor),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
