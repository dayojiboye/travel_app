import 'package:flutter/material.dart';
import 'package:travel_app/constants/categories.dart';
import 'package:travel_app/utils/margin.dart';
import 'package:travel_app/utils/theme.dart';
import 'package:travel_app/widgets/category.dart';
import 'package:travel_app/widgets/search_input.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  String selectedCategory = "";

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
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: SizedBox(
                  width: screenWidth(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: categories
                        .map(
                          (category) => Category(
                            iconSize: category.iconSize,
                            label: category.label,
                            icon: category.icon,
                            currentCategory: selectedCategory,
                            onTap: (label) => setCategory(label),
                          ),
                        )
                        .toList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
