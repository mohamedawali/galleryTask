
import 'package:dio/dio.dart';
import 'package:gallery/Repository/imagesRepo.dart';
import 'package:gallery/Repository/loginRepo.dart';
import 'package:gallery/bloc/galleryBloc/gallery_bloc.dart';
import 'package:gallery/bloc/loginBloc/login_bloc.dart';
import 'package:gallery/webService/galleryService.dart';
import 'package:gallery/webService/loginService.dart';
import 'package:get_it/get_it.dart';

final getIt=GetIt.I;
void initGetIt(){
  getIt.registerLazySingleton<LoginBloc>(() => LoginBloc(getIt()));
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginService>(() => LoginService(Dio()));


  getIt.registerLazySingleton<GalleryBloc>(() => GalleryBloc(getIt()));
  getIt.registerLazySingleton<GalleryRepo>(() => GalleryRepo(getIt()));
  getIt.registerLazySingleton<GalleryService>(() => GalleryService(Dio()));



}