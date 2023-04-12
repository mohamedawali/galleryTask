part of 'gallery_bloc.dart';

@immutable
abstract class GalleryEvent {}
class GetImages extends GalleryEvent {

  GetImages();
}
class UploadImage extends GalleryEvent {
  final File imageFile;

  UploadImage(this.imageFile);
}