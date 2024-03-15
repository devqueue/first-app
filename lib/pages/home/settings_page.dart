import 'package:firstapp/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:firstapp/pages/home/widgets/home_page_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}


class _SettingsPageState extends State<SettingsPage> {
   
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