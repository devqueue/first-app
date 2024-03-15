import 'package:firstapp/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:firstapp/pages/home/widgets/home_page_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}


class _ChatPageState extends State<ChatPage> {
   
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