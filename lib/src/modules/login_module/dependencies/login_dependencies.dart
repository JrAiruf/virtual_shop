import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:virtual_shop/src/modules/login_module/domain/usecases/user_login_cases_impl.dart';
import 'package:virtual_shop/src/modules/login_module/infra/repositories/user_login_repo_impl.dart';
import 'package:virtual_shop/src/modules/login_module/presenter/login_bloc/ij_login_bloc.dart';
import 'package:virtual_shop/src/modules/services/client_service.dart';
import '../domain/repositories/iuser_login.dart';
import '../domain/usecases/iuser_login_cases.dart';
import '../external/api_login_datasource.dart';
import '../infra/data/iuser_login_datasource.dart';
import '../presenter/controller/ij_login_controller.dart';

abstract class LoginDependencies extends Module {
  static final List<Bind> dependencies = <Bind>[
    Bind<Dio>(((i) => Dio())),
    Bind<CLientService>((i) => DioService(dio: i())),
    Bind<IUserLoginDatasource>((i) => ApiLoginDatasource(httpService: i())),
    Bind<IUserLogin>((i) => UserLoginRepoImpl(datasource: i())),
    Bind<IUserLoginCases>((i) => UserLoginCasesImpl(repository: i())),
    Bind(((i) => IJLoginBloc(i()))),
    Bind(((i) => IJLoginController()))
  ];
}
