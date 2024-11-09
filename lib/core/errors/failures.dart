import 'package:firebase_core/firebase_core.dart';

abstract class Failure {
  final String errorMessage;
  const Failure(this.errorMessage);
}

class FirebaseAuthFailure extends Failure {
  FirebaseAuthFailure(super.errorMessage);
  factory FirebaseAuthFailure.fromFirebaseAuthError(FirebaseException e) {
    switch (e.message) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        return FirebaseAuthFailure("Email already used. Go to login page.");
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        return FirebaseAuthFailure("Wrong email/password combination.");

      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        return FirebaseAuthFailure("No user found with this email.");

      case "ERROR_USER_DISABLED":
      case "user-disabled":
        return FirebaseAuthFailure("User disabled.");

      case "ERROR_TOO_MANY_REQUESTS":
        return FirebaseAuthFailure(
            "Too many requests to log into this account.");

      case "ERROR_OPERATION_NOT_ALLOWED":
      case "operation-not-allowed":
        return FirebaseAuthFailure("Server error, please try again later.");

      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        return FirebaseAuthFailure("Email address is invalid.");

      default:
        return FirebaseAuthFailure("Login failed. Please try again.");
    }
  }
}
