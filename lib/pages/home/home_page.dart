import 'package:firstapp/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:firstapp/pages/home/widgets/home_page_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: AppColors.primaryBackground,
     appBar: buildAppBar(),
     body: SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
      child: Column(
        children: [
          homePageText("Welcome", color: AppColors.primaryThirdElementText),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 5.w),
                width: 40.w,
                height: 40.w,
                child: Image.asset("assets/icons/stethoscope.png")
              ),
              SizedBox(width: 5.w),
              homePageText("User", top: 5),
            ]
          ),
          SizedBox(height: 20.h),
          searchView(),
          SizedBox(height: 30.h),
          
        ]
        ),
     )
    );
  }

}