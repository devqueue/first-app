import 'package:firstapp/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:firstapp/pages/home/widgets/home_page_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}


class _CoursePageState extends State<CoursePage> {
   
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
        ]
        ),
     )
    );
  }

}