import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/utils/theme.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
    super.key,
    required this.searchController,
    this.suffixIcon,
    this.hintText = "Search hotel",
    this.autoFocus = false,
  });

  final TextEditingController searchController;
  final String? suffixIcon;
  final String? hintText;
  final bool? autoFocus;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kPrimary,
      autofocus: autoFocus ?? false,
      style: const TextStyle(
        fontSize: 14,
        color: kPrimary,
      ),
      decoration: InputDecoration(
        fillColor: kInputBg,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
          color: kSecondary,
        ),
        filled: true,
        contentPadding: const EdgeInsets.only(
          left: 0,
          right: 12,
        ),
        prefixIcon: Container(
          margin: const EdgeInsets.only(left: 8, top: 10, bottom: 10, right: 0),
          child: SvgPicture.asset(
            "assets/icons/search-2.svg",
          ),
        ),
        suffixIcon: suffixIcon != null
            ? Container(
                margin: const EdgeInsets.only(
                  left: 0,
                  top: 10,
                  bottom: 10,
                  right: 8,
                ),
                child: SvgPicture.asset(
                  suffixIcon!,
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
