import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/utils/extensions.dart';
import 'package:travel_app/utils/margin.dart';
import 'package:travel_app/utils/theme.dart';

class Category extends StatelessWidget {
  const Category({
    super.key,
    required this.label,
    required this.icon,
    required this.currentCategory,
    required this.onTap,
    this.iconSize,
  });

  final String label;
  final String icon;
  final String currentCategory;
  final Function(String label) onTap;
  final double? iconSize;

  get isActive {
    return currentCategory == label;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(label),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? kGreen : kIconBg,
            ),
            child: Center(
              child: SvgPicture.asset(
                icon,
                width: iconSize ?? 32,
                height: iconSize ?? 32,
              ),
            ),
          ),
          const YMargin(16),
          Text(
            label.toCapitalized(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isActive ? kPrimary : kSecondary,
            ),
          )
        ],
      ),
    );
  }
}
