import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/utils/margin.dart';
import 'package:travel_app/utils/theme.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({
    super.key,
    required this.name,
    required this.images,
  });

  final String name;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                height: 200,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Image.asset(
                        images[0],
                        height: screenHeight(context),
                        fit: BoxFit.cover,
                      ),
                    ),
                    const XMargin(3),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Image.asset(
                              images[1],
                              fit: BoxFit.cover,
                            ),
                          ),
                          const YMargin(3),
                          Expanded(
                            child: Image.asset(
                              images[2],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: const Alignment(0.37, 0),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: kWhite,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/icons/red-eye.svg",
                        height: 20,
                        width: 20,
                        colorFilter: const ColorFilter.mode(
                          kRed,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Align(
                  alignment: Alignment.topRight,
                  child: ClipRRect(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(238, 238, 238, 0.4),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            "assets/icons/heart.svg",
                            colorFilter: const ColorFilter.mode(
                              kWhite,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const YMargin(14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$name, Kent, UK",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const YMargin(4),
                  const Text(
                    "34 miles away",
                    style: TextStyle(
                      fontSize: 16,
                      color: kSecondary,
                    ),
                  ),
                  const YMargin(8),
                  Container(
                    padding: const EdgeInsets.only(bottom: 1),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: kPrimary,
                        ),
                      ),
                    ),
                    child: const Text.rich(
                      TextSpan(
                        text: "\$1,031",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: kPrimary,
                        ),
                        children: [
                          TextSpan(text: " total"),
                        ],
                      ),
                      style: TextStyle(
                        fontSize: 16,
                        color: kSecondary,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/star.svg",
                    width: 24,
                    height: 24,
                  ),
                  const Text(
                    "4.99",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
