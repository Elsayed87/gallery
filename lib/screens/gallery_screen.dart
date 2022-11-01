import 'package:flutter/material.dart';
import 'package:flutter_gallery/models/gallery_model.dart';
import 'package:flutter_gallery/services/get_gallery.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  ApiGetGallery api = ApiGetGallery();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<ImageModel>>(
        future: api.getGalleryService(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, i) {
                  return Card(
                      color: Colors.red.withOpacity(0.2),
                      child: Column(
                        children: [Image.network("${snapshot.data![i].image}")],
                      ));
                }));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
