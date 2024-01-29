abstract class SignInEvent {
  const SignInEvent();
}

class CodeEvent extends SignInEvent {
  final String code;
  const CodeEvent(this.code);
}

class PhoneEvent extends SignInEvent {
  final String phone;
  const PhoneEvent(this.phone);
}
