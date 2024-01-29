import 'package:firstapp/common/values/colors.dart';
import 'package:firstapp/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:firstapp/pages/sign_in/bloc/sign_in_events.dart';
import 'package:firstapp/pages/sign_in/bloc/sign_in_states.dart';
import 'package:firstapp/pages/common_widgets.dart';
import 'package:firstapp/pages/sign_in/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Container(
        color: AppColors.registerbackground,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.registerbackground,
            appBar: buildAppBar("Welcome", color: AppColors.registerbackground),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  Center(child: reusableText("Log in using your phone number")),
                  Container(
                    margin: EdgeInsets.only(top: 36.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h), // Added space for the image
                        Center(
                          child: Image.asset(
                            'assets/images/doctorLogin.png',
                            width: 200.w,
                            height: 200.h,
                          ),
                        ),
                        SizedBox(height: 90.h),
                        reusableText("Mobile No."),
                        Row(
                          children: [
                            buildCountryCode(context, (value) {
                              context.read<SignInBloc>().add(CodeEvent(value));
                            }),
                            SizedBox(width: 5.h),
                            buildPhoneField(
                              "Enter your mobile number",
                              "phone",
                              "b_telephone",
                              (value) {
                                context
                                    .read<SignInBloc>()
                                    .add(PhoneEvent(value));
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  buildLoginandRegButton(
                    "Log In",
                    "login",
                    () {
                      SignInController(context: context).handleSignIn();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
