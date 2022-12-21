import 'package:dartz/dartz.dart';
import '../../../errors/product_errors.dart';
import '../../entities/categories_entity.dart';

abstract class IGetAllCategories {
  Future<Either<ProductModuleErrors, List<CategoryEntity>?>>? getAllCategories(String? category);
Future<Either<ProductModuleErrors, CategoryEntity?>>? getCategoryById(String? categoryId);
}