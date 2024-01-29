import 'package:firstapp/common/widgets/flutter_toast.dart';
import 'package:firstapp/pages/otp_verification/otp_controller.dart';
import 'package:firstapp/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn() async {
    try{
      final state = context.read<SignInBloc>().state;
      String code = state.code;
      String phone = state.phone;
      String phoneNumber = '$code$phone';

      if (phone.isEmpty) {
        //
        toastInfo(msg: "Please enter a phone number");
        return;
      }
      if (code.isEmpty) {
        //
        toastInfo(msg: "Please enter a phone number");
        return;
      }

      OtpController(context: context).sendOtp(phoneNumber);
      Navigator.of(context).pushNamed("/otp");

    } catch (e){
      debugPrint(e.toString());
    }
  } 
}