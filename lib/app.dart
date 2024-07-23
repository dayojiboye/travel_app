import 'package:flutter/material.dart';
import 'package:travel_app/utils/theme.dart';
import 'package:travel_app/views/search.dart';
import 'package:travel_app/widgets/bottom_nav_bar_item.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentRouteIndex = 0;

  onItemTap(int index) {
    setState(() {
      currentRouteIndex = index;
    });
  }

  final tabScreens = [
    const SearchScreen(),
    const Center(
      child: Text("Flights Screen"),
    ),
    const Center(
      child: Text("Saved Screen"),
    ),
    const Center(
      child: Text("Explore Screen"),
    ),
    const Center(
      child: Text("Bookings Screen"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      debugShowCheckedModeBanner: false,
      theme: themeData(context),
      home: Scaffold(
        backgroundColor: kWhite,
        body: tabScreens[currentRouteIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: kWhite,
          currentIndex: currentRouteIndex,
          onTap: onItemTap,
          unselectedFontSize: 14,
          selectedFontSize: 14,
          unselectedItemColor: kSecondary,
          selectedItemColor: kPrimary,
          items: [
            BottomNavigationBarItem(
              icon: BottomNavBarItem(
                isActive: currentRouteIndex == 0,
                icon: "assets/icons/search.svg",
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: BottomNavBarItem(
                isActive: currentRouteIndex == 1,
                icon: "assets/icons/flight.svg",
              ),
              label: "Flights",
            ),
            BottomNavigationBarItem(
              icon: BottomNavBarItem(
                icon: "assets/icons/heart.svg",
                isActive: currentRouteIndex == 2,
              ),
              label: "Saved",
            ),
            BottomNavigationBarItem(
              icon: BottomNavBarItem(
                icon: "assets/icons/globe.svg",
                isActive: currentRouteIndex == 3,
              ),
              label: "Explore",
            ),
            BottomNavigationBarItem(
              icon: BottomNavBarItem(
                icon: "assets/icons/calendar.svg",
                isActive: currentRouteIndex == 4,
              ),
              label: "Bookings",
            )
          ],
        ),
      ),
    );
  }
}
