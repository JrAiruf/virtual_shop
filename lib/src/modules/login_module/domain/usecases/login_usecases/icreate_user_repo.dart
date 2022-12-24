import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../errors/login_errors/login_errors.dart';
import '../../../infra/models/user_model.dart';
import '../../entities/user_entity.dart';

abstract class ICreateUserRepo {
  Future<Either<LoginError, UserEntity?>>? createUser(
      {@required UserModel? user,});
}