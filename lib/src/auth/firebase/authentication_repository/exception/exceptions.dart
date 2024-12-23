class TeamExceptions implements Exception {
  /// the associated error message
  final String message;

// {log_in_with_email_and_password_failure}
  const TeamExceptions([this.message = "An Unknown error occured"]);

  ///create an authentication message
  /// from a firebase authentication exception code
  factory TeamExceptions.fromCode(String code) {
    switch (code) {
      case "weak-password":
        return const TeamExceptions("Please Enter a stronger password");
      case "invalid-email":
        return const TeamExceptions("Email is not Valid or badly formatted");
      case "email-already_in_use":
        return const TeamExceptions("An account already exists for that email");
      case "operation-not-allowed":
        return const TeamExceptions(
            "Opretion is not allowed, please contact support.");
      case "user-disabled":
        return const TeamExceptions(
            "this user has been disabled. please contact support for help");
      case "user-not-found":
        return const TeamExceptions(
            "Invalid Details, please create an account.");
      case "too-many-requesta":
        return const TeamExceptions(
            "Too Many requests, Service Temporarily blocked.");
      case "invalid-password":
        return const TeamExceptions("Incorrect password, please try again.");
      case "invalid-argument":
        return const TeamExceptions(
            "an Invalid argument was provided to an Authentication methode.");
      case "invalid-phone-number":
        return const TeamExceptions("The provided phonr is invalid.");
      case "session-cookie-expired":
        return const TeamExceptions(
            "The provided Firebase session cookie is expired.");
      case "uid-already-exists":
        return const TeamExceptions(
            "The provided uid is already in use by an existing user.");
      default:
        return const TeamExceptions();
    }
  }
}
