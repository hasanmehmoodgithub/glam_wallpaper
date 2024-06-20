import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:glam_wallpaper/full_screen_image.dart';


class WallpaperScreen extends StatefulWidget {
  @override
  _WallpaperScreenState createState() => _WallpaperScreenState();
}

class _WallpaperScreenState extends State<WallpaperScreen> {
  final List<String> images = [
    'assets/images/image1.jpeg',
    'assets/images/image2.jpeg',
    'assets/images/image3.jpeg',
    'assets/images/image4.jpeg',
    'assets/images/image5.jpeg',
    'assets/images/image6.jpeg',
    'assets/images/image7.jpeg',
    'assets/images/image8.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Glam Wallpaper")),
        backgroundColor: Colors.orange.withOpacity(0.5),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10,right: 10,top: 20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FullScreenImage(imagePath: images[index]),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(images[index], fit: BoxFit.cover),
              ),
            );
          },
        ),
      ),
    );
  }
}
