import 'package:bloc_album_view/feature/model/album_model.dart';
import 'package:bloc_album_view/feature/service/album_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumCubit extends Cubit<AlbumState> {
  final IAlbumService albumService;
  AlbumModel? albumModel;
  bool isLoading = false;
  AlbumCubit({required this.albumService}) : super(AlbumLoading()) {
    _init();
  }

  Future<void> _init() async {
    await fetchAlbumData();
    emit(AlbumCompleted(albumModel: albumModel));
  }

  Future<void> fetchAlbumData() async {
    changeLoading();
    albumModel = await albumService.fetchAlbumItems();
    changeLoading();
  }

  void changeLoading() {
    isLoading = !isLoading;
  }
}

abstract class AlbumState {}

class AlbumLoading extends AlbumState {}

class AlbumCompleted extends AlbumState {
  AlbumModel? albumModel;
  AlbumCompleted({this.albumModel});
}
