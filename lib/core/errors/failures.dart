import 'package:firebase_core/firebase_core.dart';

abstract class Failure {
  final String errorMessage;
  const Failure(this.errorMessage);
}

class FirebaseAuthFailure extends Failure {
  FirebaseAuthFailure(super.errorMessage);
  factory FirebaseAuthFailure.fromFirebaseAuthError(FirebaseException e) {
    switch (e.code) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        return FirebaseAuthFailure("Email already used.");
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        return FirebaseAuthFailure("Wrong password .");

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

class FirestoreFailure extends Failure {
  FirestoreFailure(super.errorMessage);

  factory FirestoreFailure.fromFirestoreError(FirebaseException e) {
    switch (e.code) {
      case "permission-denied":
        return FirestoreFailure(
            "You do not have permission to perform this action.");

      case "unavailable":
        return FirestoreFailure(
            "Firestore service is currently unavailable. Please try again later.");

      case "not-found":
        return FirestoreFailure("Requested document not found.");

      case "already-exists":
        return FirestoreFailure(
            "The document you are trying to create already exists.");

      case "cancelled":
        return FirestoreFailure("The operation was cancelled.");

      case "data-loss":
        return FirestoreFailure("Data loss occurred. Please retry.");

      case "deadline-exceeded":
        return FirestoreFailure(
            "The operation took too long to complete. Please try again.");

      case "failed-precondition":
        return FirestoreFailure(
            "Operation cannot be performed in the current state.");

      case "invalid-argument":
        return FirestoreFailure(
            "An invalid argument was provided. Check your data and try again.");

      case "resource-exhausted":
        return FirestoreFailure(
            "Resource limit exceeded. Please wait or adjust your usage.");

      case "aborted":
        return FirestoreFailure("The operation was aborted. Please retry.");

      case "out-of-range":
        return FirestoreFailure("The requested operation is out of range.");

      case "internal":
        return FirestoreFailure(
            "An internal error occurred. Please try again later.");

      case "unauthenticated":
        return FirestoreFailure(
            "You are not authenticated. Please log in and try again.");

      case "unknown":
      default:
        return FirestoreFailure("An unknown error occurred. Please try again.");
    }
  }
}
