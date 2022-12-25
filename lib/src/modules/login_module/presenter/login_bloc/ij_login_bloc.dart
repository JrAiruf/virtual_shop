import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:virtual_shop/src/modules/login_module/presenter/login_bloc/login_bloc_events/ij_login_bloc_events.dart';
import 'package:virtual_shop/src/modules/login_module/presenter/login_bloc/login_bloc_states/ij_login_bloc_states.dart';
import 'package:virtual_shop/src/modules/routes/ij_app_routes.dart';
import '../../domain/usecases/login_usecases/create_user_impl.dart';
import '../../infra/models/user_model.dart';

class IJLoginBloc extends Bloc<IJLoginBlocEvents, IJLoginBlocStates> {
  IJLoginBloc(CreateUserRepoImpl usecase)
      : _usecase = usecase,
        super(IJNoUserState()) {
    on<IJCreateUserEvent>(_mapCreateUserEventToState);
  }

  final CreateUserRepoImpl _usecase;

  _mapCreateUserEventToState(
      IJCreateUserEvent event, Emitter<IJLoginBlocStates> emit) async {
    emit(IJLoadingUserState());
    onSuccess({UserModel? user, BuildContext? context}) {
      IJLoginNavigation.newUserHome(context!, args: user);
    }

    final result = await _usecase.createUser(
        user: event.user,
        onFail: onFail,
        onSuccess: onSuccess(user: event.user, context: event.context));
    onSuccess();
    result?.fold(
      (error) => emit(IJUserErrorState(errorMessage: error.toString())),
      (user) => emit(IJGetUserState(user: user!)),
    );
  }

  onFail({String? errorMessage}) {
    SnackBar(
      content: Card(
        elevation: 5,
        color: Colors.black.withOpacity(0.8),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Opa!',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                errorMessage ?? '',
                style: const TextStyle(color: Colors.black, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
