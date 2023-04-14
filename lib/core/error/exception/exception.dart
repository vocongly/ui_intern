abstract class AuthenticationFailure{}

class ServerFailure extends AuthenticationFailure{}

class DataParsingFailure extends AuthenticationFailure{}

class WrongLoginInfoFailure extends AuthenticationFailure{}

class EmptyUsernameFailure extends AuthenticationFailure{}

class EmptyPasswordFailure extends AuthenticationFailure{}

class InvaildEmailFailure extends AuthenticationFailure{}

class SpacingPasswordFailure extends AuthenticationFailure{}

class LessThan8CharPasswordFailure extends AuthenticationFailure{}

class ServerException implements Exception{}

class AuthorizationException implements Exception{}

