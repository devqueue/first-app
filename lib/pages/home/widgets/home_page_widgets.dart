import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firstapp/common/values/colors.dart';


AppBar buildAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.h,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
        
          GestureDetector(
            child: Container(
              width: 40.h,
              height: 40.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/icons/person.png")),
              ),
            ),
          )
        ],
      ),
    ),
  );
}


Widget homePageText(String text,
    {Color color = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 24.sp,  
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}



Widget searchView() {
  return Row(
    children: [
      Container(
        width: 265.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.registerbackground,
          borderRadius: BorderRadius.circular(15.h),
          border: Border.all(color: AppColors.primaryFourthElementText)
        ),
        child: Row(),
      )
    ],
  );
}