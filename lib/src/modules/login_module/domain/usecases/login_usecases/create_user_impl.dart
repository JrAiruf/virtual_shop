import 'package:dartz/dartz.dart';
import 'package:virtual_shop/src/modules/login_module/domain/repositories/icreate_user.dart';
import 'package:virtual_shop/src/modules/login_module/domain/usecases/login_usecases/icreate_user_repo.dart';
import 'package:virtual_shop/src/modules/login_module/infra/models/user_model.dart';
import '../../../errors/login_errors/login_errors.dart';
import '../../entities/user_entity.dart';

class CreateUserRepoImpl implements ICreateUserRepo {
  CreateUserRepoImpl({
    required this.repository,
  });

  final ICreateUser repository;

  @override
  Future<Either<LoginError, UserEntity?>>? createUser(
      {UserModel? user, Function()? onSuccess, onFail}) async {
    if (user == null) {
      onFail;
      return Left(UserError(error: 'Login Error'));
    }
    onSuccess;
    return (Future.value(repository.createUser(user, onSuccess, onFail)));
  }
}
