class Validator {
  static validateEmpty({required String message}) {
    return (val) => (val == '' || val == null) ? message : null;
  }
}
