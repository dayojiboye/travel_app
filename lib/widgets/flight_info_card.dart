import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/utils/margin.dart';
import 'package:travel_app/utils/theme.dart';

class FlightInfoCard extends StatelessWidget {
  const FlightInfoCard({
    super.key,
    required this.icon,
    required this.heading,
    required this.content,
  });

  final String icon;
  final String heading;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      decoration: const BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(
            color: kBorder,
          ),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: kIconBg,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                icon,
                colorFilter: const ColorFilter.mode(
                  kPrimary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          const XMargin(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                heading,
                style: const TextStyle(
                  color: Color(0XFF818181),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const YMargin(10),
              content,
            ],
          )
        ],
      ),
    );
  }
}
