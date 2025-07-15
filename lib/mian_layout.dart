import 'package:flutter/material.dart';
import 'package:markti/core/constants/colors.dart';
import 'package:markti/features/main_layout/presentation/pages/cart_screen.dart';
import 'package:markti/features/main_layout/presentation/pages/favorite_screen.dart';
import 'package:markti/features/main_layout/presentation/pages/home_page.dart';

import 'core/resources/color_manager.dart';
import 'features/main_layout/presentation/pages/profile_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  List<Widget> screens = [
    HomePage(),
    CartScreen(),
    FavoriteScreen(),
    ProfileScreen()
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  screens[currentIndex],
     bottomNavigationBar: BottomNavigationBar(
       currentIndex: currentIndex,
         onTap: (index) {
         setState(() {
           currentIndex = index;
         });
         },
       backgroundColor: appColors.KPwhite,
       type: BottomNavigationBarType.fixed,
       selectedItemColor: ColorManager.primary,
       unselectedItemColor: ColorManager.white,
       showSelectedLabels: false,
       // Hide selected item labels
       showUnselectedLabels: false,
         items:  [
           BottomNavigationBarItem(
             icon: Icon(Icons.home,color: Colors.black,),
             label: 'Home',
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.shopping_cart,color: Colors.black),
             label: 'Cart',
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.favorite,color: Colors.black),
             label: 'Favorites',
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.menu,color: Colors.black),
             label: 'Menu',
           ),
         ],
     ),
    );
  }
}
