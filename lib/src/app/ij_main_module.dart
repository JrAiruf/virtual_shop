import 'package:flutter_modular/flutter_modular.dart';
import 'package:virtual_shop_project/src/modules/application_images_module/external/data/firebase_images_database.dart';
import 'package:virtual_shop_project/src/modules/application_images_module/presenter/ij_get_images_blocs/ij_get_images_bloc.dart';
import 'package:virtual_shop_project/src/modules/application_images_module/presenter/pages/ij_home_page.dart';
import '../modules/application_images_module/domain/repositories/get_application_images_repo.dart';
import '../modules/application_images_module/domain/usecases/get_application_images_impl.dart';
import '../modules/application_images_module/domain/usecases/iget_application_images.dart';
import '../modules/application_images_module/infra/data/get_images_datasource.dart';
import '../modules/application_images_module/infra/repositories/get_application_images_repo_impl.dart';

class IJMainModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<GetImagesDatasource>((i) => FirebaseDatabase()),
        Bind<IGetApplicationImagesRepo>((i) => GetApplicationImagesRepoImpl(datasource: i(),)),
        Bind<IGetApplicationImages>((i) => GetApplicationImagesImpl(imagesRepository: i())),
        Bind((i) => IJGetImagesBloc(usecase: i()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, __) => const IJHome()),
      ];
}
