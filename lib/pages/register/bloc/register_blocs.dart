import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firstapp/pages/register/bloc/register_events.dart';
import 'package:firstapp/pages/register/bloc/register_states.dart';


class RegisterBlocs extends Bloc<RegisterEvent, RegisterStates>{
  RegisterBlocs(): super(const RegisterStates()){
    on<UserNameEvent>(_userNameEvent);
    on<EmailEvent>(_emailEvent);
    on<CodeEvent>(_codeEvent);
    on<PhoneEvent>(_phoneEvent);
    on<DateOfBirthEvent>(_dateOfBirthEvent);
  }

  void _userNameEvent(UserNameEvent event, Emitter<RegisterStates> emit){
  emit(state.copyWith(userName: event.userName));
  }

  void _emailEvent(EmailEvent event, Emitter<RegisterStates> emit){
  emit(state.copyWith(email: event.email));
  }

  void _codeEvent(CodeEvent event, Emitter<RegisterStates> emit){
  emit(state.copyWith(code: event.code));
  }

  void _phoneEvent(PhoneEvent event, Emitter<RegisterStates> emit){
  emit(state.copyWith(phone: event.phone));
  }

  void _dateOfBirthEvent(DateOfBirthEvent event, Emitter<RegisterStates> emit){
  emit(state.copyWith(dateofbirth: event.dateOfBirth));
  }

}


