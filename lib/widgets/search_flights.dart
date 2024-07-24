import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/utils/margin.dart';
import 'package:travel_app/utils/theme.dart';
import 'package:travel_app/widgets/flight_tile.dart';
import 'package:travel_app/widgets/heading_text.dart';
import 'package:travel_app/widgets/search_input.dart';

class SearchFlights extends StatefulWidget {
  const SearchFlights({super.key});

  @override
  State<SearchFlights> createState() => _SearchFlightsState();
}

class _SearchFlightsState extends State<SearchFlights> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: screenHeight(context) / 1.09,
      child: SafeArea(
        child: AnimatedPadding(
          padding: MediaQuery.of(context).viewInsets,
          duration: const Duration(milliseconds: 0),
          curve: Curves.decelerate,
          child: Container(
            padding: const EdgeInsets.only(
              top: 8.5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 65,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: Color(0XFFD9D9D9),
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 28,
                    left: 20,
                    right: 20,
                    bottom: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HeadingText(text: "Where To?"),
                      const YMargin(16),
                      SearchInput(
                        searchController: searchController,
                        hintText: "Search destination",
                        autoFocus: true,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          color: kInputBg,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 12,
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/arrow-arc-left.svg",
                                width: 28,
                                height: 28,
                                colorFilter: const ColorFilter.mode(
                                  kDeeperGreen,
                                  BlendMode.srcIn,
                                ),
                              ),
                              const XMargin(16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Return",
                                    style: TextStyle(
                                      color: kDeeperGreen,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const YMargin(2),
                                  Row(
                                    children: [
                                      const Text(
                                        "DFW",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: kSecondary,
                                        ),
                                      ),
                                      const XMargin(2),
                                      SvgPicture.asset(
                                        "assets/icons/arrow-sm-right.svg",
                                        width: 18,
                                        height: 18,
                                        colorFilter: const ColorFilter.mode(
                                          kSecondary,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      const XMargin(2),
                                      const Text(
                                        "DFB",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: kSecondary,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const Spacer(),
                              SvgPicture.asset(
                                "assets/icons/arrow-sub-down-right.svg",
                                width: 24,
                                height: 24,
                                colorFilter: const ColorFilter.mode(
                                  kPrimary,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 14,
                            left: 18,
                            right: 18,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Recent",
                                style: TextStyle(
                                  color: kPrimary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              YMargin(10),
                              FlightTile(),
                              FlightTile(),
                              FlightTile(),
                              YMargin(20),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
