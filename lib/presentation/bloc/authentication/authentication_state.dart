part of 'authentication_cubit.dart';

abstract class AuthenticationState{}

class AuthenticationInitialState extends AuthenticationState{}

class UnAuthenticatedState extends AuthenticationState{}

class AuthenticatedState extends AuthenticationState{}
