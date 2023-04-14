import 'package:either_dart/either.dart';

import '../../core/error/exception/exception.dart';

class ValidationHelper {
  static Either<AuthenticationFailure, void> validatePassword(String password) {
    String moreThan8CharPattern = r"^.{8,}$";
    String noSpacePattern = r"^(?!.* )";

    if (password.isEmpty) return Left(EmptyPasswordFailure());

    RegExp moreThan8Char = RegExp(moreThan8CharPattern);
    RegExp noSpace = RegExp(noSpacePattern);

    if (!moreThan8Char.hasMatch(password)) {
      return Left(LessThan8CharPasswordFailure());
    }
    if (!noSpace.hasMatch(password)) {
      return Left(SpacingPasswordFailure());
    }
    return const Right(null);
  }

  static Either<AuthenticationFailure, void> validEmail(String email) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp validEmail = RegExp(pattern);
    if (!validEmail.hasMatch(email)) return Left(InvaildEmailFailure());
    return const Right(null);
  }
}
