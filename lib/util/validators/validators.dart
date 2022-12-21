class Validators {
  static const String NAME_REGEX =
      r"^[\w'\-,.][^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}$";
  static const String EMAIL_REGEX =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$";
  static const String PASSWORD_REGEX =
      r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$";

  static bool checkRegex(String regex, String value) {
    final regExp = RegExp(regex);
    return regExp.hasMatch(value);
  }

  static String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Name is required! Can\'t be null';
    }

    return !checkRegex(NAME_REGEX, name) ? "Invalid name." : null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required! Can\'t be null';
    }

    return !checkRegex(EMAIL_REGEX, email) ? "Invalid email address." : null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required!';
    }

    return !checkRegex(PASSWORD_REGEX, password)
        ? "Password must be at least 8 characters and contain a number, a  special character, a capital and a small letter."
        : null;
  }
}
