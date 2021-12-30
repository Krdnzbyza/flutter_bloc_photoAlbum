import 'dart:io';

import 'package:bloc_album_view/core/extension/network_path.dart';
import 'package:bloc_album_view/feature/model/album_model.dart';
import 'package:dio/dio.dart';

abstract class IAlbumService {
  final Dio dio;

  IAlbumService(this.dio);
  final String albumPath = IAlbumServicePath.albumPath.rawValue;

  Future<AlbumModel?> fetchAlbumItems();
}

class AlbumService extends IAlbumService {
  AlbumService(Dio dio) : super(dio);

  @override
  Future<AlbumModel?> fetchAlbumItems() async {
    final response = await dio.get(albumPath);
    if (response.statusCode == HttpStatus.ok) {
      return AlbumModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}
