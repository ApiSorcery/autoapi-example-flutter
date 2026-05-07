/// A utility class for validating form inputs.
/// 
/// Provides static methods for common validation patterns including
/// empty value checks and email format validation.
class Validator {
  /// Validates that a value is not empty.
  /// 
  /// Returns a function that checks if the value is empty or null.
  /// 
  /// Parameters:
  ///   - [message]: The error message to return if validation fails
  /// 
  /// Returns:
  ///   A validator function that returns the [message] if invalid, null if valid
  static validateEmpty({required String message}) {
    return (val) => (val == '' || val == null) ? message : null;
  }

  /// Validates that a value is not empty and has a valid email format.
  /// 
  /// Returns a function that checks if the value is a valid email address.
  /// Accepts standard email format (user@domain.extension).
  /// 
  /// Returns:
  ///   A validator function that returns:
  ///   - 'Cannot be empty' if the value is empty or null
  ///   - 'Invalid email format' if the email format is invalid
  ///   - null if the email is valid
  static validateEmail() {
    return (val) {
      if (val == '' || val == null) {
        return 'Cannot be empty';
      }
      final RegExp emailRegex = RegExp(
        r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      );
      return emailRegex.hasMatch(val) ? null : 'Invalid email format';
    };
  }
}