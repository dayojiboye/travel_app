import 'package:flutter/material.dart';
import 'package:travel_app/constants/categories.dart';
import 'package:travel_app/constants/hotels.dart';
import 'package:travel_app/utils/margin.dart';
import 'package:travel_app/utils/theme.dart';
import 'package:travel_app/widgets/category.dart';
import 'package:travel_app/widgets/custom_button.dart';
import 'package:travel_app/widgets/hotel_card.dart';
import 'package:travel_app/widgets/search_input.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  String selectedCategory = "Beach";

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void setCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const CustomButton(
        label: "Map",
        rightIcon: "assets/icons/map.svg",
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          padding: const EdgeInsets.only(
            top: 20,
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Welcome Carolina Terner",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: kSecondary,
                      ),
                    ),
                    const YMargin(4),
                    const Text(
                      "Perfect Stay Finder",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: kPrimary,
                        fontSize: 32,
                      ),
                    ),
                    const YMargin(24),
                    SearchInput(
                      searchController: searchController,
                      suffixIcon: "assets/icons/filter.svg",
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 115,
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          itemBuilder: (context, index) {
                            return Category(
                              iconSize: categories[index].iconSize,
                              label: categories[index].label,
                              icon: categories[index].icon,
                              currentCategory: selectedCategory,
                              onTap: (label) => setCategory(label),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const XMargin(28);
                          },
                          itemCount: categories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      const YMargin(20),
                      ListView.separated(
                        separatorBuilder: (context, index) {
                          return const YMargin(24);
                        },
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: 50,
                        ),
                        itemBuilder: (context, index) {
                          return HotelCard(
                            name: hotels[index].name,
                            images: hotels[index].images,
                          );
                        },
                        itemCount: 2,
                        primary: false,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
