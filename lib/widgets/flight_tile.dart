import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/utils/margin.dart';
import 'package:travel_app/utils/theme.dart';

class FlightTile extends StatelessWidget {
  const FlightTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: kBorder,
          ),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        horizontalTitleGap: 12,
        minLeadingWidth: 0,
        titleAlignment: ListTileTitleAlignment.center,
        leading: SvgPicture.asset(
          "assets/icons/clock-counter.svg",
          colorFilter: const ColorFilter.mode(kGrey, BlendMode.srcIn),
          width: 28,
          height: 28,
        ),
        title: Row(
          children: [
            const Text(
              "DFW",
              style: TextStyle(
                fontSize: 16,
                color: kPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const XMargin(2),
            SvgPicture.asset(
              "assets/icons/arrow-sm-right.svg",
              width: 22,
              height: 22,
              colorFilter: const ColorFilter.mode(
                kPrimary,
                BlendMode.srcIn,
              ),
            ),
            const XMargin(2),
            const Text(
              "DFB",
              style: TextStyle(
                fontSize: 16,
                color: kPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        subtitle: const Text(
          "Dallas to Dubai",
          style: TextStyle(
            color: kSecondary,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
