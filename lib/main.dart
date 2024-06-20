
import 'package:flutter/material.dart';
import 'package:glam_wallpaper/wallpaper_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Glam Wallpaper App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WallpaperScreen(),
    );
  }
}

