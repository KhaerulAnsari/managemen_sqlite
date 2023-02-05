import 'package:flutter/material.dart';
import 'package:managemen_sqlite/theme.dart';

class FormWidget extends StatelessWidget {
  final String? title;
  final String? hintText;
  final TextEditingController? textEditingController;
  final bool? obscureText;
  final Widget? widget;
  final bool? enabled;
  final Color? colorHintText;
  const FormWidget({
    super.key,
    this.textEditingController,
    this.obscureText,
    this.title,
    this.hintText,
    this.widget,
    this.enabled,
    this.colorHintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title!,
          style: blackTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 50,
          child: TextFormField(
            obscureText: obscureText ?? false,
            controller: textEditingController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                left: 15,
              ),
              enabled: enabled ?? true,
              suffixIcon: widget ?? const SizedBox(),
              fillColor: const Color(0xFFF1F0F5),
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                  color: blueColor,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide.none,
              ),
              hintText: hintText,
              hintStyle: greyTextStyle.copyWith(
                color: colorHintText ?? greyColor,
              ),
            ),
            style: blackTextStyle,
          ),
        ),
      ],
    );
  }
}
