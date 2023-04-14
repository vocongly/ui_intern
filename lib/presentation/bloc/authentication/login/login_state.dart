part of 'login_cubit.dart';

abstract class LoginState{}

class LoginInitState extends LoginState{}

class WrongLoginInfoState extends LoginState{}

class InvaildUsernameState extends LoginState{
  InvaildUsernameState(this.content);

  final String content;

  List<Object> get props => [content];
}

class InvaildPasswordState extends LoginState{
  InvaildPasswordState(this.content);

  final String content;

  List<Object> get props => [content];
}

class DisconnectState extends LoginState{}

class ErrorState extends LoginState{}

