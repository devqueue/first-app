import 'package:firstapp/common/values/colors.dart';
import 'package:firstapp/pages/common_widgets.dart';
import 'package:firstapp/pages/otp_verification/bloc/otp_blocs.dart';
import 'package:firstapp/pages/otp_verification/bloc/otp_states.dart';
import 'package:firstapp/pages/otp_verification/otp_controller.dart';
import 'package:firstapp/pages/register/bloc/register_blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';


class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {

  final TextEditingController _pinPutController = TextEditingController();

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(20),
    ),
  );


  @override
  Widget build(BuildContext context) {
    // final state = widget.blocState;
    final state = context.read<RegisterBlocs>().state;
    String countryCode = state.code;
    String phoneNumber = state.phone;

    
    return BlocBuilder<OtpBlocs, OtpStates>(
      builder: (context, state) {
        return Container(
          color: AppColors.registerbackground,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: AppColors.registerbackground,
              appBar: buildAppBar("Phone Verification",
                  color: AppColors.registerbackground),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 40),
                      child: Center(
                        child: Text(
                          'Verify $countryCode $phoneNumber',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 26),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Pinput(
                        length: 6,
                        defaultPinTheme: defaultPinTheme,
                        controller: _pinPutController,
                        pinAnimationType: PinAnimationType.fade,
                        onSubmitted: (pin) async {
                          // do something
                          OtpController(context: context).verifyOtp(pin);
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    buildLoginandRegButton(
                      "Submit",
                      "login",
                      () {
                        // do something
                        OtpController(context: context)
                            .verifyOtp(_pinPutController.text);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    // Todo: send otp
    final state = context.read<RegisterBlocs>().state;
    String countryCode = state.code;
    String phoneNumber = state.phone;
    String fullNumber = '$countryCode$phoneNumber';

    OtpController(context: context).sendOtp(fullNumber);
  }
}