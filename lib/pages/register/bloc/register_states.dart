class RegisterStates {
  final String userName;
  final String email;
  final String code; //country code
  final String phone;
  final DateTime? dateofbirth;

  const RegisterStates({
    this.userName = "",
    this.email = "",
    this.code = "",
    this.phone = "",
    this.dateofbirth,
  });

  RegisterStates copyWith({
    String? userName,
    String? email,
    String? code,
    String? phone,
    DateTime? dateofbirth
  
  }) {

    return RegisterStates(
        userName: userName ?? this.userName,
        email: email ?? this.email,
        code: code ?? this.code,
        phone: phone ?? this.phone,
        dateofbirth: dateofbirth ?? this.dateofbirth,

    );


  }

}