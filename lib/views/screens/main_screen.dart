import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/views/screens/account_screen.dart';
import 'package:shop_app/views/screens/cart_screen.dart';
import 'package:shop_app/views/screens/category_screen.dart';
import 'package:shop_app/views/screens/favorite_screen.dart';
import 'package:shop_app/views/screens/home_screen.dart';
import 'package:shop_app/views/screens/shop_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;

  List<Widget> _pages = [
    HomeScreen(),
    ShopScreen(),
    CategoryScreen(),
    CartScreen(),
    FavoriteScreen(),
    AccountScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType
            .fixed, // bottom navigation bar type for fixed ให้เต็มๆ
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        unselectedItemColor: Colors.black,
        selectedItemColor: Color.fromRGBO(20, 60, 109, 1.0),
        currentIndex: pageIndex, // กำหนดให้เปิดหน้าจอที่เมนูที่ 1 (index 1)
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/store-1.png',
              width: 20,
            ),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/shop.svg',
              width: 20,
            ),
            label: 'SHOP',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/explore.svg'),
            label: 'CATEGORY',
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
        ],
      ),
      body: _pages[pageIndex],
    );
  }
}
