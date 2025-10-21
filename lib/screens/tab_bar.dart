import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flowfin/screens/coming_soon.dart';
import 'package:flowfin/screens/invoices.dart';
import 'package:flowfin/screens/leaderboard.dart';
import 'package:flutter/material.dart';
import 'package:flowfin/api/models/user.dart';
import 'package:flowfin/services/auth.dart';

import 'home.dart';

class HomeScreen extends StatefulWidget {
  final AuthService authService;
  final User user;

  const HomeScreen({super.key, required this.authService, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _bottomNavIndex = 0;

  final List<IconData> bottomNavIcons = [
    Icons.home_rounded,
    Icons.receipt_long_rounded,
    Icons.account_balance_rounded,
    Icons.leaderboard_rounded,
  ];

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(user: widget.user, authService: widget.authService),
      InvoicesPage(),
      ComingSoonPage(),
      LeaderboardPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    const accentColor = Color(0xFFa188a6);
    const backgroundColor = Color(0xFFf2e2e3);

    return Scaffold(
      backgroundColor: backgroundColor,

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: accentColor,
        shape: const CircleBorder(),
        child: const Icon(Icons.qr_code_scanner, color: Colors.black, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: bottomNavIcons,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        backgroundColor: accentColor,
        activeColor: const Color(0xFFf2e2e3),
        inactiveColor: Colors.grey.shade900,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        safeAreaValues: SafeAreaValues(top: false),
      ),

      body: SafeArea(
        bottom: false,
        child: IndexedStack(index: _bottomNavIndex, children: _pages),
      ),
    );
  }
}
