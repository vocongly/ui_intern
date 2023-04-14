import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_intern/presentation/bloc/authentication/login/login_cubit.dart';
import 'package:ui_intern/ulti/controller/loading_cover_controller.dart';
import 'package:ui_intern/ulti/helper/token_helper.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticatedState()) {
    authenticate();
  }

  authenticate([State? state]) async {
    bool tokenValid = await TokenHelper.checkToken();
    if (tokenValid) {
      emit(AuthenticatedState());
    } else {
      emit(UnAuthenticatedState());
    }

    if (state != null && state.mounted) {
      GetIt.instance.get<LoadingCoverController>().close(state.context);
    }
  }

  login(
      {required BuildContext context,
      required String username,
      required String password,
      State? state}) async {
    GetIt.instance.get<LoadingCoverController>().common(context);
    bool loginResult = await GetIt.instance
        .get<LoginCubit>()
        .login(username: username, password: password);
    if (loginResult) {
      authenticate(state);
    } else {
      if (state != null && state.mounted) {
        GetIt.instance.get<LoadingCoverController>().close(state.context);
      }
    }
  }

  logout(BuildContext context){
    // Navigator.popUntil(context, ModalRoute.withName(RouterPath.root) );
    emit(UnAuthenticatedState());
    TokenHelper.removeToken();
  }
}
