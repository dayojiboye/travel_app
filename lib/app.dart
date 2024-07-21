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

  Widget currentRouteView() {
    switch (currentRouteIndex) {
      case 1:
        return const Center(
          child: Text("Flights Screen"),
        );
      case 2:
        return const Center(
          child: Text("Saved Screen"),
        );
      case 3:
        return const Center(
          child: Text("Explore Screen"),
        );
      case 4:
        return const Center(
          child: Text("Bookings Screen"),
        );
      default:
        return const SearchScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      debugShowCheckedModeBanner: false,
      theme: themeData(context),
      home: Scaffold(
        backgroundColor: kWhite,
        body: currentRouteView(),
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
                size: 18,
                isActive: currentRouteIndex == 0,
                icon: "assets/icons/search.svg",
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: BottomNavBarItem(
                // size: 24,
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
