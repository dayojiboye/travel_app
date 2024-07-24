import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:travel_app/constants/trip_options.dart";
import "package:travel_app/utils/margin.dart";
import "package:travel_app/utils/theme.dart";
import "package:travel_app/widgets/category.dart";
import "package:travel_app/widgets/heading_text.dart";

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
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
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
            padding: const EdgeInsets.only(top: 24),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
