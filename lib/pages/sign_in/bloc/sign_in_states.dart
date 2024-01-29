class SignInState {
  final String code;
  final String phone;

  SignInState({this.code = "+966", this.phone = ""});

  SignInState copyWith({String? code, String? phone}) {
    return SignInState(
      code: code ?? this.code,
      phone: phone ?? this.phone,
    );
  }
}
