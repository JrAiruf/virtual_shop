import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:staggered_grid_view_flutter/widgets/sliver.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:virtual_shop/src/modules/home_module/presenter/ij_get_images_blocs/ij_get_images__events/ij_get_images_events.dart';
import 'package:virtual_shop/src/modules/home_module/presenter/ij_get_images_blocs/ij_get_images_bloc.dart';
import 'package:virtual_shop/src/modules/home_module/presenter/ij_get_images_blocs/ij_get_images_states/ij_get_images_states.dart';
import 'package:virtual_shop/src/modules/login_module/presenter/login_bloc/login_bloc_states/ij_login_bloc_states.dart';
import '../../../categories_and_products_module/layout/components/ij_drawer.dart';
import '../../../categories_and_products_module/layout/ij_enums/ij_drawer_enum.dart';

class IJHome extends StatelessWidget {
  IJHome({super.key});

  final bloc = Modular.get<IJGetImagesBloc>();
  final user = Modular.args;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        drawer: IJDrawerComponent(
          position: IJDrawerPosition.home,
          myUser: user.data,
        ),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                bloc.add(
                  InitializeSearch(),
                );
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ],
        ),
        body: BlocBuilder(
          bloc: bloc,
          builder: (_,__) {
            return SizedBox(
              height: height,
              width: width,
              child: Stack(
                children: [
                  _buildBodyBack(),
                  CustomScrollView(
                    slivers: [
                      BlocBuilder(
                          bloc: bloc,
                          builder: (context, snapshot) {
                            final state = bloc.state;
                            if (state is IJinitialState) {
                              return SliverToBoxAdapter(
                                child: SizedBox(
                                  height: height * 0.8,
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              );
                            }

                            if (state is IJLoadingState || state is IJLoadingUserState) {
                              return SliverToBoxAdapter(
                                child: SizedBox(
                                  height: height * 0.8,
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              );
                            }
                            if (state is IJErrorState || state is IJUserErrorState) {
                              return SliverToBoxAdapter(
                                child: Center(
                                  child: Container(),
                                ),
                              );
                            }
                            if (state is IJSucessResultState) {
                              final listImages = state.imagesList;
                              return SliverStaggeredGrid.count(
                                crossAxisCount: 2,
                                mainAxisSpacing: 1,
                                crossAxisSpacing: 1,
                                staggeredTiles: listImages!.map((images) {
                                  return StaggeredTile.count(
                                      images.xAxis!, images.yAxis! * 1.0);
                                }).toList(),
                                children: listImages
                                    .map((images) => FadeInImage.memoryNetwork(
                                          placeholder: kTransparentImage,
                                          image: images.url!,
                                          fit: BoxFit.cover,
                                        ))
                                    .toList(),
                              );
                            }
                            return SliverToBoxAdapter(child: Container());
                          }),
                    ],
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }

  Widget _buildBodyBack() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            Colors.white,
            Colors.grey,
          ],
        ),
      ),
    );
  }
}
