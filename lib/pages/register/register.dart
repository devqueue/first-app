import 'package:firstapp/common/values/colors.dart';
import 'package:firstapp/pages/common_widgets.dart';
import 'package:firstapp/pages/register/bloc/register_blocs.dart';
import 'package:firstapp/pages/register/bloc/register_events.dart';
import 'package:firstapp/pages/register/bloc/register_states.dart';
import 'package:firstapp/pages/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBlocs, RegisterStates>(
        builder: (context, state) {
      return Container(
          color: AppColors.registerbackground,
          child: SafeArea(
            child: Scaffold(
                backgroundColor: AppColors.registerbackground,
                appBar:
                    buildAppBar("Sign Up", color: AppColors.registerbackground),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Center(
                          child: reusableText(
                              "Enter your  details below and sign up")),
                      Container(
                          margin: EdgeInsets.only(top: 40.h),
                          padding: EdgeInsets.only(left: 25.w, right: 25.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              reusableText("Full name"),
                              buildTextField(
                                  "Enter your full name", "name", "user",
                                  (value) {
                                context
                                    .read<RegisterBlocs>()
                                    .add(UserNameEvent(value));
                              }),
                              reusableText("Email"),
                              buildTextField(
                                  "Enter your email address", "email", "mail2",
                                  (value) {
                                context
                                    .read<RegisterBlocs>()
                                    .add(EmailEvent(value));
                              }),
                              reusableText("Date of Birth"),
                              buildDatePickerField(
                                context,
                                "Enter Here",
                                "Select your date of birth",
                                (DateTime date) {
                                  context
                                      .read<RegisterBlocs>()
                                      .add(DateOfBirthEvent(date));
                                },
                                state.dateofbirth,
                              ),
                            ],
                          )),
                      Container(
                        margin: EdgeInsets.only(left: 5.w, right: 5.w),
                        child:
                            privacyPolicyLinkAndTermsOfService(), //reusableText("By creating an account you agree to our terms and conditions"),
                      ),
                      // SizedBox(
                      //   height: 5.h,
                      // ),
                      buildLoginandRegButton(
                        "Continue",
                        "login",
                        () {
                          //Navigator.of(context).pushNamed("register");
                          RegisterController(context: context)
                              .handleOnboarding();
                        },
                      ),
                      SizedBox(
                        height: 50.h,
                      )
                    ],
                  ),
                )),
          ));
    });
  }
}
