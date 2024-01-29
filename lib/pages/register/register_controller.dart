import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstapp/common/widgets/flutter_toast.dart';
import 'package:firstapp/pages/otp_verification/bloc/otp_blocs.dart';
import 'package:firstapp/pages/register/bloc/register_blocs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController({required this.context});

  bool isNumeric(String s) {
    return double.tryParse(s) != null;
  }

  Future<void> handleOnboarding() async {
    final state = context.read<RegisterBlocs>().state;
    final otpState = context.read<OtpBlocs>().state;
    String userName = state.userName;
    String email = state.email;
    DateTime? dateOfBirth = state.dateofbirth;
    UserCredential? userCredential = otpState.credential;

    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    if (userName.isEmpty) {
      toastInfo(msg: "Username cannot be empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email cannot be empty");
      return;
    }
    if (dateOfBirth == null) {
      toastInfo(msg: "Date of Birth cannot be empty");
      return;
    }

    // Convert dateOfBirth to DateTime
    DateTime birthDate;
    // ignore: unnecessary_type_check
    if (dateOfBirth is DateTime) {
      birthDate = dateOfBirth;
    } else if (dateOfBirth is String) {
      try {
        birthDate = DateTime.parse(dateOfBirth as String);
      } catch (e) {
        // Handle invalid dateOfBirth format
        return;
      }
    } else {
      // Handle invalid dateOfBirth format
      return;
    }

    // Calculate the age based on the current date
    DateTime currentDate = DateTime.now();
    Duration difference = currentDate.difference(birthDate);
    int years = (difference.inDays / 365).floor();

    // Check if age is less than 10
    if (years < 10) {
      // Display an error message or take appropriate action
      toastInfo(msg: "You must be 18 years or older");
      return;
    }

    if (!emailValid) {
      toastInfo(msg: "Email is invalid");
      return;
    }

    try{
      userCredential?.user?.updateEmail(email);
      userCredential?.user?.updateDisplayName(userName);

      final CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('users');

      String userId = userCredential?.user?.uid ?? '';

      if (userId.isNotEmpty) {
        Map<String, dynamic> userData = {
          'user_name': userName,
          'email': email,
          'date_of_birth': dateOfBirth,
        };

       // Use the user's UID as the document ID
        await usersCollection.doc(userId).set(userData);

        // set email and name 
        userCredential?.user?.updateEmail(email);
        userCredential?.user?.updateDisplayName(userName);


        // Continue with your navigation logic here
        Navigator.of(context)
            .pushNamedAndRemoveUntil("/application", (route) => false);


      } else {
        debugPrint('Error: Document ID is empty');
      }

    } catch (e) {
      debugPrint('Error saving data to Firestore: $e');
       toastInfo(msg: "An Error Occured while saving the data");
    }

  }
}