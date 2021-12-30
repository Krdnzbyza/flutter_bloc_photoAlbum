enum IAlbumServicePath { albumPath }

extension ILoginServicePathExtension on IAlbumServicePath {
  String get rawValue {
    switch (this) {
      case IAlbumServicePath.albumPath:
        return '/api/users?page=2';
    }
  }
}
