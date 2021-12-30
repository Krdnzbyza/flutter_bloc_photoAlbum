import 'package:bloc_album_view/core/contants/color_contants.dart';
import 'package:bloc_album_view/core/contants/string_contants.dart';
import 'package:bloc_album_view/feature/service/album_service.dart';
import 'package:bloc_album_view/feature/viewmodel/album_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';

class AlbumView extends StatelessWidget {
  final int _gridCrossAxisCount = 2;
  final double _cardElevation = 10;
  const AlbumView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AlbumCubit(albumService: AlbumService(Dio(BaseOptions(baseUrl: StringConstants.baseUrl)))),
      child: BlocConsumer<AlbumCubit, AlbumState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              body: CustomScrollView(
            slivers: [
              const SliverAppBar(
                backgroundColor: ColorConstants.appBarColor,
                actions: [Icon(Icons.favorite)],
                title: Text(StringConstants.tittlelogin),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: context.dynamicHeight(0.3), child: Lottie.asset(StringConstants.lottieUrl)),
              ),
              SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return context.watch<AlbumCubit>().isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Padding(
                          padding: context.paddingLow,
                          child: Card(
                            elevation: _cardElevation,
                            child: Column(
                              children: [
                                Text(context.read<AlbumCubit>().albumModel?.data?[index].firstName ?? ''),
                                Text(context.read<AlbumCubit>().albumModel?.data?[index].lastName ?? ''),
                                Image(
                                  image: NetworkImage(context.read<AlbumCubit>().albumModel?.data?[index].avatar ?? ''),
                                  fit: BoxFit.scaleDown,
                                )
                              ],
                            ),
                          ));
                }, childCount: context.read<AlbumCubit>().albumModel?.data?.length),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: _gridCrossAxisCount),
              )
            ],
          ));
        },
      ),
    );
  }
}
