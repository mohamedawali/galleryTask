import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:gallery/Repository/imagesRepo.dart';
import 'package:gallery/models/imagesResponse.dart';
import 'package:meta/meta.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  GalleryRepo galleryRepo;
  GalleryBloc(this.galleryRepo) : super(GalleryInitial()) {
    on<GalleryEvent>((event, emit)async {
     if(event is GetImages){
       await getImages(emit);
     }else if(event is UploadImage){
       await uploadImage(event.imageFile);
     }
    });
  }

 Future getImages(Emitter<GalleryState> emit)async {
  await  galleryRepo.getImages().then((images) => emit(GetImagesState(images)));
  }

  uploadImage(File imageFile) async{
  await  galleryRepo.uploadImage(imageFile);
  }
}
