import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstapp/common/widgets/flutter_toast.dart';
import 'package:firstapp/pages/otp_verification/bloc/otp_blocs.dart';
import 'package:firstapp/pages/otp_verification/bloc/otp_events.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class OtpController {
  final BuildContext context;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  OtpController({required this.context});

  Future<void> sendOtp(String phoneNumber) async {

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        toastInfo(msg: e.message!);
        debugPrint(e.message!);
      },
      codeSent: (String verificationID, int? resendToken) {
        context.read<OtpBlocs>().add(VerificationCodeEvent(verificationID));
      },
      codeAutoRetrievalTimeout: (String verificationID) {
        context.read<OtpBlocs>().add(VerificationCodeEvent(verificationID));
      },
      timeout: const Duration(seconds: 1200),
    );

  }

}