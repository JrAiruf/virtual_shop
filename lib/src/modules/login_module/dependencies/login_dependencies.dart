import 'package:flutter_modular/flutter_modular.dart';
import 'package:virtual_shop/src/modules/login_module/domain/repositories/icreate_user.dart';
import 'package:virtual_shop/src/modules/login_module/external/user_data/firebase_userdatasource.dart';
import 'package:virtual_shop/src/modules/login_module/presenter/login_bloc/ij_login_bloc.dart';
import '../domain/usecases/login_usecases/create_user_impl.dart';
import '../domain/usecases/login_usecases/icreate_user_repo.dart';
import '../infra/data/user_datasource.dart';
import '../infra/repositories/user_datasource_impl.dart';
import '../presenter/controller/ij_login_controller.dart';

abstract class LoginDependencies extends Module{

static final List<Bind> dependencies = <Bind>[
Bind<IUserDataSource>((i)=> FirebaseUserDatabase()),
Bind<ICreateUser>((i)=> UserDatasourceRepoImpl(dataSource: i())),
Bind<ICreateUserRepo>((i)=> CreateUserRepoImpl(repository: i())),
Bind(((i) => IJLoginBloc(i()))),
Bind(((i) => IJLoginController()))
];

} 