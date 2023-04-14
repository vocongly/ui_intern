import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:ui_intern/core/error/exception/exception.dart';

import '../../../../data/config/locator/service_path.dart';
import '../../../../data/config/services/repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitState());

  Future<bool> login(
      {required String username, required String password}) async {
    final loginInfo = {"email": username, "password": password};
    Either<AuthenticationFailure, void> loginPackage =
        await Repository.login(loginInfo: loginInfo, uri: ServicePath.login);
    if(loginPackage.isLeft){
      if(loginPackage.isLeft is ServerFailure){
        emit(DisconnectState());
        return false;
      }
      if(loginPackage.isLeft is WrongLoginInfoFailure){
        emit(WrongLoginInfoState());
        return false;
      }
      if(loginPackage.isLeft is EmptyUsernameFailure){
        emit(InvaildUsernameState('Nhập lại email của bạn'));
        return false;
      }
      if(loginPackage.isLeft is EmptyPasswordFailure){
        emit(InvaildPasswordState('Nhập lại mật khẩu của bạn'));
        return false;
      }
      if(loginPackage.isLeft is SpacingPasswordFailure){
        emit(InvaildPasswordState('Mật khẩu không có khoảng trắng'));
        return false;
      }
      if(loginPackage.isLeft is LessThan8CharPasswordFailure){
        emit(InvaildPasswordState('Mật khẩu phải trên 8 kí tự'));
      }
      emit(ErrorState());
      return false;
    }
    return true;
  }
}
