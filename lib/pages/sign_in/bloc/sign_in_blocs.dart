import 'package:firstapp/pages/sign_in/bloc/sign_in_states.dart';
import 'package:firstapp/pages/sign_in/bloc/sign_in_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<CodeEvent>(_codeEvent);
    on<PhoneEvent>(_phoneEvent);
  }

  void _codeEvent(CodeEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(code: event.code));
  }

  void _phoneEvent(PhoneEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(phone: event.phone));
  }
}
