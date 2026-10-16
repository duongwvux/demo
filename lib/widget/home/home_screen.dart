import 'package:core/widget/app_bottom_navigation.dart';
import 'package:core/widget/screen_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:prj2/widget/home/home_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenHeaderWidget(
        title: const Text("Home"),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: null,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: null,
          ),
        ],
      ),
      body: HomeBody(),
      bottomNavigationBar: AppBottomNavigation(
          items: [
            AppBottomNavItem(icon: Icons.home, label: "Home"),
            AppBottomNavItem(icon: Icons.search, label: "Search"),
            AppBottomNavItem(icon: Icons.pie_chart, label: "Chart"),
            AppBottomNavItem(icon: Icons.settings, label: "Settings"),
          ],
      ),
    );
  }
}
