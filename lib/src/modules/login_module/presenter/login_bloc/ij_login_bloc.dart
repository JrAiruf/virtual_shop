import 'package:bloc/bloc.dart';
import 'package:virtual_shop/src/modules/login_module/presenter/login_bloc/login_bloc_events/ij_login_bloc_events.dart';
import 'package:virtual_shop/src/modules/login_module/presenter/login_bloc/login_bloc_states/ij_login_bloc_states.dart';
import '../../domain/usecases/iuser_login_cases.dart';

class IJLoginBloc extends Bloc<IJLoginBlocEvents, IJLoginBlocStates> {
  IJLoginBloc(IUserLoginCases usecase)
      : _usecase = usecase,
        super(IJInitialState()) {
    on<IJCreatingUserEvent>(_mapCreateUserEventToState);
    on<IJGetUserEvent>(_mapIJGetUserEventToState);
    on<IJSignInEvent>(_mapIJSignInEventToState);
  }

  final IUserLoginCases _usecase;

  void _mapCreateUserEventToState(
      IJCreatingUserEvent event, Emitter<IJLoginBlocStates> emit) async {
    emit(IJLoadingUserState());
    final result =
        await _usecase.createUser(event.user, event.onSuccess, event.onFail);
    result?.fold(
      (error) => emit(IJUserErrorState(errorMessage: error.toString())),
      (user) => emit(IJCreatingUserState()),
    );
  }

  void _mapIJGetUserEventToState(
      IJGetUserEvent event, Emitter<IJLoginBlocStates> emit) async {
    emit(IJLoadingUserState());
    final result =
        await _usecase.getUserData(event.user, event.onSuccess, event.onFail);
    result!.fold(
        (error) => emit(IJUserErrorState(errorMessage: error.toString())),
        (user) => IJGotgUserState(user: event.user));
  }

  void _mapIJSignInEventToState(
      IJSignInEvent event, Emitter<IJLoginBlocStates> emit) async {
    emit(IJLoadingUserState());
    final result =
        await _usecase.signIn(event.user, event.onSuccess, event.onFail);
    result!.fold(
        (error) => emit(IJUserErrorState(errorMessage: error.toString())),
        (user) => IJSignInState(user: event.user!));
  }
}
