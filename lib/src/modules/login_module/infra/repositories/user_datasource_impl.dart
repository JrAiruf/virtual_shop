// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:virtual_shop/src/modules/login_module/domain/entities/user_entity.dart';
import 'package:virtual_shop/src/modules/login_module/domain/repositories/icreate_user.dart';
import 'package:virtual_shop/src/modules/login_module/errors/login_errors/login_errors.dart';
import 'package:virtual_shop/src/modules/login_module/infra/models/user_model.dart';
import '../data/user_datasource.dart';

class UserDatasourceRepoImpl implements ICreateUser {
  UserDatasourceRepoImpl({required this.dataSource});
  final IUserDataSource dataSource;
  
  @override
  Future<Either<LoginError, UserEntity?>>? createUser(UserModel? user) async {
      try {
      final result = await dataSource.createUser(user);
      return Right(result!);
    } catch (e) {
      throw Left(UserError(error: 'Erro'));
    }
  }
  

}