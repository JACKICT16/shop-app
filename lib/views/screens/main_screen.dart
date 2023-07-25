import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/store-1.png',
            width: 20,
          ),
          label: 'HOME',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/explore.svg'),
          label: 'CATEGORIES',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/cart.svg'),
          label: 'CART',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/favorite.svg'),
          label: 'FAVORITES',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/account.svg'),
          label: 'ACCOUNT',
        ),
      ]),
    );
  }
}
