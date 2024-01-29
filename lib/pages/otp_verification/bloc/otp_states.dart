import 'package:firebase_auth/firebase_auth.dart';

class OtpStates {
  final String verificationCode;
  final UserCredential? credential;

  const OtpStates({this.credential, this.verificationCode = ""});

  OtpStates copyWith({
    String? verificationCode,
    UserCredential? credential,
  }) {
    return OtpStates(
      verificationCode: verificationCode ?? this.verificationCode,
      credential: credential ?? this.credential,
    );
  }
}
