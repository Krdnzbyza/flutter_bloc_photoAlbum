import 'package:flutter/material.dart';

import 'feature/view/album_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', debugShowCheckedModeBanner: false, home: AlbumView());
  }
}
