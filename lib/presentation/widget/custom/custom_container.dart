import 'package:dcit24/presentation/widget/custom/custom_text.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final double margin;
  final double padding;
  final Alignment? alignemnt;
  final Color? color;
  final double radius;
  final VoidCallback? function;
  final Color? fontColor;
  final BoxBorder? border;
  const CustomContainer({
    super.key,
    required this.text,
    this.width,
    this.height,
    required this.margin,
    required this.padding,
    this.alignemnt,
    this.color,
    required this.radius,
    this.function,
    this.fontColor,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        margin: EdgeInsets.all(margin),
        padding: EdgeInsets.all(padding),
        alignment: alignemnt,
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: border,
          borderRadius: BorderRadius.circular(radius),
          color: color,
        ),
        child: CustomText(
          text: text,
          color: fontColor,
        ),
      ),
    );
  }
}
