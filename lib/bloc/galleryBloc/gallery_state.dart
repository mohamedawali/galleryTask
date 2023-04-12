part of 'gallery_bloc.dart';

@immutable
abstract class GalleryState {}

class GalleryInitial extends GalleryState {}
class GetImagesState extends GalleryState {
 final ImagesResponse imagesResponse;

 GetImagesState(this.imagesResponse);
}