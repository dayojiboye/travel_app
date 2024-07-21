import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/utils/theme.dart';

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({
    super.key,
    required this.isActive,
    required this.icon,
  });

  final bool isActive;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      child: SvgPicture.asset(
        icon,
        alignment: Alignment.center,
        height: 24,
        width: 24,
        colorFilter: ColorFilter.mode(
          isActive ? kPrimary : kSecondary,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
