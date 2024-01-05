abstract class RegisterEvent{
  const RegisterEvent();
}

class UserNameEvent extends RegisterEvent{
  final String userName;
  const UserNameEvent(this.userName);
}

class EmailEvent extends RegisterEvent{
  final String email;
  const EmailEvent(this.email);
}

class CodeEvent extends RegisterEvent{
  final String code;
  const CodeEvent(this.code);
}

class PhoneEvent extends RegisterEvent{
  final String phone;
  const PhoneEvent(this.phone);
}

class DateOfBirthEvent extends RegisterEvent{
  final DateTime dateOfBirth;
  const DateOfBirthEvent(this.dateOfBirth);
}