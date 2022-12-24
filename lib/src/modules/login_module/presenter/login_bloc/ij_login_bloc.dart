import 'package:bloc/bloc.dart';
import 'package:virtual_shop/src/modules/login_module/presenter/login_bloc/login_bloc_events/ij_login_bloc_events.dart';
import 'package:virtual_shop/src/modules/login_module/presenter/login_bloc/login_bloc_states/ij_login_bloc_states.dart';

class IJLoginBloc extends Bloc<IJLoginBlocEvents, IJLoginBlocStates> {
  IJLoginBloc() : super(IJNoUserState()) {
    on<IJCreateUserEvent>(_mapCreateUserEventToState);
  }

  _mapCreateUserEventToState(
      IJCreateUserEvent event, Emitter<IJLoginBlocStates> emit) async {}
}
