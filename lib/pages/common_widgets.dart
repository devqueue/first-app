// ignore_for_file: depend_on_referenced_packages

import 'package:firstapp/common/values/colors.dart';
import 'package:firstapp/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

AppBar buildAppBar(String type, {Color color = AppColors.primaryBackground}) {
  return AppBar(
    backgroundColor: color,
    centerTitle: true,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        // height defines the thickness of the line
        height: 1.0,
      ),
    ),
    title: Text(
      type,
      style: TextStyle(
        color: AppColors.primaryText,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

Widget buildThirdPartyLogin(BuildContext context) {
  return Center(
    child: Container(
        margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
        padding: EdgeInsets.only(left: 70.w, right: 70.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _reusableIcons("google"),
            _reusableIcons("apple"),
            _reusableIcons("facebook"),
          ],
        )),
  );
}

Widget _reusableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
        width: 40.w,
        height: 40.w,
        child: Image.asset("assets/icons/$iconName.png")),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(
      bottom: 5.h,
    ),
    child: Text(
      text,
      style: TextStyle(
          color: AppColors.reusableTextcolour,
          fontWeight: FontWeight.normal,
          fontSize: 14.sp),
    ),
  );
}

Widget buildTextField(String hintText, String textType, String iconName,
    void Function(String value)? func) {
  return Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        color: AppColors.buildtextfieldcolor,
        borderRadius: BorderRadius.all(Radius.circular(15.w)),
        border: Border.all(color: AppColors.buildtextfieldborder),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 17.w),
            height: 16.w,
            width: 16.w,
            child: Image.asset("assets/icons/$iconName.png"),
          ),
          SizedBox(
            width: 270.w,
            height: 50.h,
            child: TextField(
              onChanged: (value) => func!(value),
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: hintText,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                hintStyle: const TextStyle(
                  color: AppColors.primarySecondaryElementText,
                ),
              ),
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.normal,
                fontSize: 14.sp,
              ),
              autocorrect: false,
              obscureText: textType == "password" ? true : false,
            ),
          )
        ],
      ));
}

Widget buildCountryCode(
    BuildContext context, void Function(String value)? func) {
  const countryPicker = FlCountryCodePicker(
    showDialCode: true,
  
    showSearchBar: true,

    // @chetna Please modify these
    // title: _yourModalTitleWidget,
    // filteredCountries: _yourFilters,
    // countryTextStyle: _yourCountryTextStyle,
    // dialCodeTextStyle: _yourdialCodeTextStyle,
    // searchBarDecoration: _yourInputDecoration,
  );

  String countrycode = context.read<SignInBloc>().state.code;

  return Container(
    width: 80.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 20.h),
    decoration: BoxDecoration(
      color: AppColors.registerbackground,
      borderRadius: BorderRadius.all(Radius.circular(15.w)),
      border: Border.all(color: AppColors.buildtextfieldborder),
    ),
    child: GestureDetector(
      onTap: () async {
        // Show the country code picker when tapped.
        final code = await countryPicker.showPicker(
            context: context, initialSelectedLocale: 'IN');

        if (code != null) {
          countrycode = code.dialCode;
          func!(countrycode);
        } else {
          countrycode = '+91';
          func!('+91');
        }

        // Null check
      },
      child: SizedBox(
          width: 1.w,
          height: 1.h,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 17.w),
                height: 16.w,
                width: 16.w,
                child: Image.asset("assets/icons/b_telephone.png"),
              ),
              SizedBox(
                width: 4.h,
              ),
              Text(context.read<SignInBloc>().state.code),
              // Image.asset("assets/icons/$iconName.png")
            ],
          )),
    ),
  );
}
Widget buildDatePickerField(
  BuildContext context,
  String labelText,
  String hintText,
  Function(DateTime) onChanged,
  DateTime? selectedDate, // Add selectedDate parameter
) {
  final TextEditingController _controller = TextEditingController();

  if (selectedDate != null) {
    _controller.text = DateFormat('dd/MM/yyyy').format(selectedDate);
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      GestureDetector(
        onTap: () async {
          final DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: selectedDate ?? DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );

          if (pickedDate != null) {
            _controller.text = DateFormat('dd/MM/yyyy').format(pickedDate);
            onChanged(pickedDate);
          }
        },
        child: AbsorbPointer(
          child: Container(
            width: 325.w,
            height: 50.h,
            margin: EdgeInsets.only(bottom: 20.h),
            decoration: BoxDecoration(
              color: AppColors.buildtextfieldcolor,
              borderRadius: BorderRadius.all(Radius.circular(15.w)),
              border: Border.all(color: AppColors.buildtextfieldborder),
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 17.w),
                  height: 16.w,
                  width: 16.w,
                  child: Image.asset('assets/icons/calender.png'), // Replace with your asset image
                ),
                SizedBox(
                  width: 270.w,
                  height: 50.h,
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: hintText,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      hintStyle: const TextStyle(
                        color: AppColors.primarySecondaryElementText,
                      ),
                    ),
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontFamily: "Avenir",
                      fontWeight: FontWeight.normal,
                      fontSize: 14.sp,
                    ),
                    autocorrect: false,
                    readOnly: true, // Make the text field read-only
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ],
  );
}


Widget buildDropdownField(
  BuildContext context,
  String labelText,
  List<String> options,
  String? selectedOption,
  void Function(String?) onChanged,
) {
  // Remove duplicate values from options list
  final uniqueOptions = options.toSet().toList();

  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 20.h),
    decoration: BoxDecoration(
      color: AppColors.buildtextfieldcolor,
      borderRadius: BorderRadius.all(Radius.circular(15.w)),
      border: Border.all(color: AppColors.buildtextfieldborder),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.w),
      child: Row(
        children: [
          Image.asset(
            "assets/icons/dropdown.png",
            height: 16.w,
            width: 16.w,
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: DropdownButton<String>(
              isExpanded: true,
              value: selectedOption,
              hint: Text(
                labelText,
                style: TextStyle(
                  color: AppColors.primarySecondaryElementText,
                  fontFamily: "Avenir",
                  fontSize: 14.sp,
                ),
              ),
              onChanged: onChanged,
              items: uniqueOptions.map((option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    ),
  );
}








Widget buildPhoneField(String hintText, String textType, String iconName,
    void Function(String value)? func) {
  return Container(
      width: 238.w,
      height: 50.h,
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        color: AppColors.registerbackground,
        borderRadius: BorderRadius.all(Radius.circular(15.w)),
        border: Border.all(color: AppColors.buildtextfieldborder),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 205.w,
            height: 50.h,
            child: TextField(
              onChanged: (value) => func!(value),
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: hintText,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                hintStyle: const TextStyle(
                  color: AppColors.primarySecondaryElementText,
                ),
              ),
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.normal,
                fontSize: 14.sp,
              ),
              autocorrect: false,
              obscureText: textType == "password" ? true : false,
            ),
          )
        ],
      ));
}

Widget forgotPassword() {
  return Container(
      margin: EdgeInsets.only(left: 25.w),
      width: 260.w,
      height: 44.h,
      child: GestureDetector(
        onTap: () {},
        child: Text(
          "Forgot password?",
          style: TextStyle(
              color: AppColors.primaryText,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primaryText,
              fontSize: 12.sp),
        ),
      ));
}

Widget buildLoginandRegButton(
    String buttonName, String buttonType, void Function()? func) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(
          left: 25.w, right: 25.w, top: buttonType == "login" ? 40.h : 20.h),
      decoration: BoxDecoration(
          color: buttonType == 'login'
              ? AppColors.registerbackground
              : AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.w),
          border: Border.all(
            color: buttonType == 'login'
                ? Colors.transparent
                : AppColors.primaryFourthElementText,
          ),
          boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 1),
                color: Colors.grey.withOpacity(0.1))
          ]),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: buttonType == 'login'
                ? AppColors.primaryText
                : AppColors.primaryText,
          ),
        ),
      ),
    ),
  );
}

Widget privacyPolicyLinkAndTermsOfService() {
  return Container(
    padding: EdgeInsets.only(left: 25.w),
    child: Text.rich(TextSpan(
        text: 'By continuing, you agree to our ',
        style: TextStyle(fontSize: 13.sp, color: Colors.grey.withOpacity(0.5)),
        children: <TextSpan>[
          TextSpan(
              text: 'Terms of Service',
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey.withOpacity(0.5),
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // code to open / launch terms of service link here
                  _launchURL('https://pub.dev/');
                }),
          TextSpan(
              text: ' and ',
              style: TextStyle(
                  fontSize: 13.sp, color: Colors.grey.withOpacity(0.5)),
              children: <TextSpan>[
                TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.grey.withOpacity(0.5),
                        decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // code to open / launch privacy policy link here
                        _launchURL('https://flutter.dev/');
                      })
              ])
        ])),
  );
}

_launchURL(String link) async {
  // final Uri url = Uri.parse(link);
  // if (!await launchUrl(url)) {
  //   throw Exception('Could not launch $url');
  // }
}
