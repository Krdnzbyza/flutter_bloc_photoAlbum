class StringConstants {
  static StringConstants? _instace;
  static StringConstants get instance {
    _instace ??= StringConstants._init();
    return _instace!;
  }

  StringConstants._init();
  static const tittlelogin = 'Flutter Cubit Bloc Photo Album';
  static const lottieUrl = 'assets/lottie/newyear.json';
  static const baseUrl = "https://reqres.in";
}
