mixin EmailValidation {
  bool isEmailValid(String email) {
    return emailRegex.hasMatch(email);
  }

  final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
}
