import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/utils/theme.dart';

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({
    super.key,
    required this.isActive,
    required this.icon,
    this.size = 20,
  });

  final bool isActive;
  final String icon;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      child: SvgPicture.asset(
        icon,
        alignment: Alignment.center,
        height: size,
        width: size,
        colorFilter: const ColorFilter.mode(
          kPrimary,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
