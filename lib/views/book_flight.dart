import "package:flutter/material.dart";
import "package:travel_app/constants/trip_options.dart";
import "package:travel_app/utils/margin.dart";
import "package:travel_app/utils/theme.dart";
import "package:travel_app/widgets/category.dart";
import "package:travel_app/widgets/custom_button.dart";
import "package:travel_app/widgets/destination_card.dart";
import "package:travel_app/widgets/flight_info_card.dart";
import "package:travel_app/widgets/heading_text.dart";
import "package:travel_app/widgets/search_flights.dart";

class BookFlightScreen extends StatefulWidget {
  const BookFlightScreen({super.key});

  @override
  State<BookFlightScreen> createState() => _BookFlightScreenState();
}

class _BookFlightScreenState extends State<BookFlightScreen> {
  String currentTripOption = "One way";

  _onSelectTripOption(String option) {
    setState(() {
      currentTripOption = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 20,
        ),
        child: Scaffold(
          backgroundColor: kWhite,
          appBar: AppBar(
            backgroundColor: kWhite,
            titleSpacing: 0,
            automaticallyImplyLeading: false,
            leading: null,
            title: const HeadingText(text: "Book Your Flight"),
            centerTitle: false,
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.close,
                  color: kPrimary,
                  size: 28,
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              vertical: 36,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    height: 115,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Category(
                          label: tripOptions[index].name,
                          activeBgColor: kDeepGreen,
                          icon: tripOptions[index].icon,
                          currentCategory: currentTripOption,
                          onTap: _onSelectTripOption,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const XMargin(28);
                      },
                      itemCount: tripOptions.length,
                      shrinkWrap: true,
                    ),
                  ),
                ),
                const YMargin(24),
                const DestinationCard(),
                const YMargin(8),
                const FlightInfoCard(
                  icon: "assets/icons/calendar-minus.svg",
                  heading: "Departure",
                  content: Text(
                    "10 Oct, 2023",
                    style: TextStyle(
                      color: kPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const YMargin(8),
                FlightInfoCard(
                  icon: "assets/icons/passenger.svg",
                  heading: "Passenger & Class",
                  content: Row(
                    children: [
                      const Text(
                        "1 Adult",
                        style: TextStyle(
                          color: kPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const XMargin(6),
                      Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          color: Color(0XFFD8D8D8),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const XMargin(6),
                      const Text(
                        "Business",
                        style: TextStyle(
                          color: kPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                const YMargin(52),
                CustomButton(
                  label: "Search Flights",
                  width: double.infinity,
                  height: 56,
                  leftIcon: "assets/icons/plane-filled.svg",
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return const SearchFlights();
                      },
                      backgroundColor: kWhite,
                      isScrollControlled: true,
                      clipBehavior: Clip.hardEdge,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(24),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
