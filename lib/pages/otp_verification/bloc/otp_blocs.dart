import 'package:firstapp/pages/otp_verification/bloc/otp_events.dart';
import 'package:firstapp/pages/otp_verification/bloc/otp_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpBlocs extends Bloc<OtpEvent, OtpStates> {
  OtpBlocs() : super(const OtpStates()) {
    on<VerificationCodeEvent>(_verificationCodeEvent);
    on<UserCredentialEvent>(_userCredentialEvent);
  }

  void _verificationCodeEvent(
      VerificationCodeEvent event, Emitter<OtpStates> emit) {
    emit(state.copyWith(verificationCode: event.verificationCode));
  }

  void _userCredentialEvent(
      UserCredentialEvent event, Emitter<OtpStates> emit) {
    emit(state.copyWith(credential: event.credential));
  }
}
