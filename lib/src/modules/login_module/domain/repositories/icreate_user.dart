import 'package:dartz/dartz.dart';
import 'package:virtual_shop/src/modules/login_module/infra/models/user_model.dart';

import '../../errors/login_errors/login_errors.dart';
import '../entities/user_entity.dart';

abstract class ICreateUser {
  Future<Either<LoginError, UserEntity?>>? createUser(
    UserModel? user,
    Function()? onSuccess,
    Function()? onFail,
  );
}
