import 'package:firebase_auth/firebase_auth.dart';

abstract class OtpEvent {
  const OtpEvent();
}

class VerificationCodeEvent extends OtpEvent {
  final String verificationCode;
  const VerificationCodeEvent(this.verificationCode);
}

class UserCredentialEvent extends OtpEvent {
  final UserCredential credential;
  const UserCredentialEvent(this.credential);
}
