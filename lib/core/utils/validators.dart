class AppValidators {
  // Email Validation
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email is required";
    }

    final emailRegex =
    RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');

    if (!emailRegex.hasMatch(value.trim())) {
      return "Enter a valid email";
    }

    return null;
  }

  // Username Validation
  static String? validateUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Username is required";
    }

    if (value.trim().length < 3) {
      return "Username must be at least 3 characters";
    }

    if (value.trim().length > 20) {
      return "Username cannot exceed 20 characters";
    }

    return null;
  }

  // Password Validation
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }

    if (value.length < 6) {
      return "Password must be at least 6 characters";
    }

    // Optional strong password rule
    final passwordRegex =
    RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*?&]+$');

    if (!passwordRegex.hasMatch(value)) {
      return "Password must contain letters & numbers";
    }

    return null;
  }

  //  Confirm Password
  static String? validateConfirmPassword(
      String? value, String password) {
    if (value == null || value.isEmpty) {
      return "Confirm your password";
    }

    if (value != password) {
      return "Passwords do not match";
    }

    return null;
  }

  //Phone Number (Optional)
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number is required";
    }

    if (value.length < 10) {
      return "Enter valid phone number";
    }

    return null;
  }
}