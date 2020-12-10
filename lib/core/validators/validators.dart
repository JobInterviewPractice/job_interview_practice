class Validators {
  static String emailValidator(String text) {
    if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(text)) {
      return null;
    }
    return 'Invalid email format';
  }

  static String notEmpty(String text) {
    if (text.length >= 5) {
      return null;
    }
    return 'Password should has 5 letters at least';
  }
}