import 'package:dots_indicator/dots_indicator.dart';
import 'package:firstapp/common/values/constants.dart';
import 'package:firstapp/global.dart';
import 'package:firstapp/pages/welcome/bloc/welcome_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firstapp/common/values/colors.dart';
import 'bloc/welcome_blocs.dart';
import 'bloc/welcome_states.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state){

          return Container(
            margin: EdgeInsets.only(top: 34.h),
            width: 375.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (index){
                    state.page = index;
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                  },
                  children: [
                    _buildPage(
                      context,
                      "Next",
                      "assets/images/boy.png" 
                    ),
                    _buildPage(
                      context,
                      "Next",
                      "assets/images/man.png" 
                    ),
                    _buildPage(
                      context,
                      "Get Started",
                      "assets/images/reading.png" 
                    )
                  ],
                ),
                Positioned(
                  bottom: 50.h,
                  child: DotsIndicator(
                    position: state.page,
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                      color: AppColors.primaryThirdElementText,
                      activeColor: AppColors.primaryElement,
                      size: const Size.square(8.0),
                      activeSize: const Size(18.0, 8.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0)
                      )
                    ),
                  ),
                )
              ],
            ),
          );
        },
      )
    );
  }

  Widget _buildPage(
    BuildContext context,
    String buttonName,
    String imagePath
  ){
    return Column(
      children: [
        SizedBox(
          width: 370.w,
          height: 550.w,
          child: Padding(
            padding: EdgeInsets.only(top: 0.h),
            child: Image.asset(imagePath, fit: BoxFit.cover)
          ),
        ),
        GestureDetector(
          onTap: (){
            int index = pageController.page!.round();
            if (index>2){
              pageController.animateTo(
                index+1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.decelerate
              );
            } else{
              // storage service
              Global.storageService.setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
              Navigator.of(context).pushNamedAndRemoveUntil("/sign_in", (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 80.h, left:25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.primaryButton,
              borderRadius: BorderRadius.all(Radius.circular(15.w)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 2)
                )
              ]
            ),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal
                ),
              )
            ),
          ),
        ),
      ],
    );
  }


}