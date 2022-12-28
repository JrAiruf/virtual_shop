// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:virtual_shop/src/modules/home_module/errors/get_images_errors.dart';

class DatasourceErrors implements GetImagesError {
  DatasourceErrors({required this.messageError});
  String messageError;
}
