import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/utils/margin.dart';
import 'package:travel_app/utils/theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    this.leftIcon,
    this.rightIcon,
    this.labelFontWeight = FontWeight.w600,
    this.width = 100,
    this.height = 48,
    this.iconSize = 20,
  });

  final String label;
  final String? leftIcon;
  final String? rightIcon;
  final FontWeight? labelFontWeight;
  final double? width;
  final double? height;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(kDeepGreen),
        fixedSize: MaterialStatePropertyAll(
          Size(width!, height!),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          leftIcon != null
              ? SvgPicture.asset(
                  leftIcon!,
                  width: iconSize,
                  height: iconSize,
                )
              : const SizedBox(),
          leftIcon != null ? const XMargin(8) : const SizedBox(),
          Text(
            label,
            style: TextStyle(
              color: kPrimary,
              fontSize: 14,
              fontWeight: labelFontWeight,
            ),
          ),
          rightIcon != null ? const XMargin(6) : const SizedBox(),
          rightIcon != null
              ? SvgPicture.asset(
                  rightIcon!,
                  width: iconSize,
                  height: iconSize,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
