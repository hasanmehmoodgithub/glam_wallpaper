import 'package:flutter/material.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class FullScreenImage extends StatelessWidget {
  final String imagePath;

  FullScreenImage({required this.imagePath});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Glam Wallpaper"),
        backgroundColor: Colors.orange.withOpacity(0.5),
      ),
      body: Center(
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange.withOpacity(0.5),
        onPressed: () => _downloadImage(context),
        child: const Icon(Icons.download),
      ),
    );
  }

  Future<void> _downloadImage(BuildContext context) async {
    try {
      // Load the image data from the asset
      ByteData imageData = await rootBundle.load(imagePath);
      Uint8List bytes = imageData.buffer.asUint8List();

      // Get the temporary directory
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = '${tempDir.path}/${imagePath.split('/').last}';

      // Save the image to the temporary directory
      File file = File(tempPath);
      await file.writeAsBytes(bytes);

      // Save the image to the gallery
      await GallerySaver.saveImage(file.path);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Image saved to gallery')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save image: $e')),
      );
    }
  }
}