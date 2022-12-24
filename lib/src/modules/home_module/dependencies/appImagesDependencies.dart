// ignore_for_file: file_names

import 'package:flutter_modular/flutter_modular.dart';
import '../domain/repositories/iget_application_images_repo.dart';
import '../domain/usecases/get_application_images_impl.dart';
import '../domain/usecases/iget_application_images.dart';
import '../external/data/firebase_images_database.dart';
import '../infra/data/get_images_datasource.dart';
import '../infra/repositories/get_application_images_repo_impl.dart';
import '../presenter/ij_get_images_blocs/ij_get_images_bloc.dart';

abstract class AppImagesDependencies extends Module {
  static final List<Bind> dependencies = <Bind>[
    Bind<GetImagesDatasource>((i) => FirebaseDatabase()),
    Bind<IGetApplicationImagesRepo>((i) => GetApplicationImagesRepoImpl(datasource: i())),
    Bind<IGetApplicationImages>((i) => GetApplicationImagesImpl(imagesRepository: i())),
    Bind((i) => IJGetImagesBloc(usecase: i()))
  ];
}
