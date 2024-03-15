import 'package:firstapp/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firstapp/pages/home/home_page.dart';
import 'package:firstapp/pages/home/course_page.dart';
import 'package:firstapp/pages/home/Chat_page.dart';
import 'package:firstapp/pages/home/Settings_page.dart';


int currentIndex = 0;

Widget buildPage(int index) {
  List<Widget> widget = [
    // Replace these with your actual page widgets
    const HomePage(),
    const CoursePage(),
    const ChatPage(),
    const SettingsPage()
  ];

  return widget[index];
}

var bottomTabs = [
  BottomNavigationBarItem(
    label: "home",
    icon: SizedBox(
      height: 20.h,
      width: 20.w,
      child: Image.asset("assets/icons/home.png"),
    ),
    activeIcon: SizedBox(
      height: 20.h,
      width: 20.w,
      child: Image.asset("assets/icons/home.png", color: AppColors.primaryElement),
    ),
  ),
  
  BottomNavigationBarItem(
    label: "home",
    icon: SizedBox(
      height: 20.h,
      width: 20.w,
      child: Image.asset("assets/icons/play-circle1.png"),
    ),
    activeIcon: SizedBox(
      height: 20.h,
      width: 20.w,
      child: Image.asset("assets/icons/play-circle1.png", color: AppColors.primaryElement),
    ),
  ),
  
  BottomNavigationBarItem(
    label: "home",
    icon: SizedBox(
      height: 20.h,
      width: 20.w,
      child: Image.asset("assets/icons/home.png"),
    ),
    activeIcon: SizedBox(
      height: 20.h,
      width: 20.w,
      child: Image.asset("assets/icons/home.png", color: AppColors.primaryElement),
    ),
  ),
  
  BottomNavigationBarItem(
    label: "home",
    icon: SizedBox(
      height: 20.h,
      width: 20.w,
      child: Image.asset("assets/icons/home.png"),
    ),
    activeIcon: SizedBox(
      height: 20.h,
      width: 20.w,
      child: Image.asset("assets/icons/home.png", color: AppColors.primaryElement),
    ),
  ),
  
];