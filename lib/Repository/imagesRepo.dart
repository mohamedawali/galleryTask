import 'dart:io';

import 'package:dio/dio.dart';

import '../models/imagesResponse.dart';
import '../webService/galleryService.dart';

class GalleryRepo {
  GalleryService galleryService;

  GalleryRepo(this.galleryService);

  Future<ImagesResponse> getImages() async {
    var response = await galleryService.getImages();
    return ImagesResponse.fromJson(response);
  }

  Future uploadImage(File imageFile) async {
    String lastPath = imageFile.path.split('/').last;
    FormData formData = FormData.fromMap({
      'img': await MultipartFile.fromFile(imageFile.path, filename: lastPath)
    });
    await galleryService.uploadImage(formData);
  }
}
