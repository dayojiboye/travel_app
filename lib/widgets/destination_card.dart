import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/utils/margin.dart';
import 'package:travel_app/utils/theme.dart';

class DestinationCard extends StatelessWidget {
  const DestinationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        border: Border.fromBorderSide(
          BorderSide(color: kBorder),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.scale(
                    scaleX: -1,
                    child: SvgPicture.asset(
                      "assets/icons/flight-takeoff.svg",
                      colorFilter: const ColorFilter.mode(
                        kSecondary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  const XMargin(4),
                  const Text(
                    "From",
                    style: TextStyle(
                      color: kSecondary,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
              const YMargin(8),
              const Text(
                "Dhaka",
                style: TextStyle(
                  color: kGrey,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const YMargin(48),
              const Divider(
                height: 1,
                thickness: 1,
                color: kBorder,
              ),
              const YMargin(48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.scale(
                    scaleX: -1,
                    child: SvgPicture.asset(
                      "assets/icons/flight-landing.svg",
                      colorFilter: const ColorFilter.mode(
                        kSecondary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  const XMargin(4),
                  const Text(
                    "To",
                    style: TextStyle(
                      color: kSecondary,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
              const YMargin(8),
              const Text(
                "Amhmedabad",
                style: TextStyle(
                  color: kGrey,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Positioned(
            child: Container(
              width: 52,
              height: 52,
              decoration: const BoxDecoration(
                color: kGreen,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/icons/arrow-up-down.svg",
                  colorFilter: const ColorFilter.mode(
                    kPrimary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
