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

    Future<void> verifyOtp(String otp) async {
      final state = context.read<OtpBlocs>().state;
      String verficationCode = state.verificationCode;
      
    try {
      // verify otp
      AuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: verficationCode, smsCode: otp);

      var creds = await _auth.signInWithCredential(phoneAuthCredential);

      context.read<OtpBlocs>().add(UserCredentialEvent(creds));
    

      if (creds.user?.email != null) {
        // ignore_for_file: use_build_context_synchronously
        Navigator.of(context)
            .pushNamedAndRemoveUntil("/application", (route) => false);
      } else {
        Navigator.of(context).pushNamed('/register');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        _auth.currentUser?.delete();
        toastInfo(msg: "Email is already in use");
        Navigator.pop(context);
      } else {
        debugPrint(e.toString());
        toastInfo(msg: e.toString());
      }
    }
    }



}