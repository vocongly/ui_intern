
import 'package:either_dart/either.dart';
import 'package:ui_intern/core/error/exception/exception.dart';
import 'package:ui_intern/ulti/helper/token_helper.dart';
import 'package:ui_intern/ulti/helper/validation_helper.dart';

import '../models/token.dart';
import 'api_service_client.dart';

class Repository {
  static Future<Either<AuthenticationFailure, void>> login({
    required String uri,
    required Map<String, dynamic> loginInfo,
  }) async {
    try {
      Either<AuthenticationFailure, void> validUsername =
          ValidationHelper.validEmail(loginInfo["email"]);
      if (validUsername.isLeft) return Left(validUsername.left);
      Either<AuthenticationFailure, void> validatePassword =
          ValidationHelper.validatePassword(loginInfo["password"]);
      if (validatePassword.isLeft) return Left(validatePassword.left);

      dynamic rawToken =
          await APIServiceClient.post(params: loginInfo, uri: uri);
      Token token = Token.fromJson(rawToken);
      await TokenHelper.saveToken(token: token);
      return const Right(null);
    } catch (e) {
      if (e is ServerException) {
        return Left(ServerFailure());
      }
      if (e is AuthorizationException) {
        return Left(WrongLoginInfoFailure());
      }
      return Left(DataParsingFailure());
    }
  }
}
