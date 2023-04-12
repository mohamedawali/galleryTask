import 'package:flutter/material.dart';
import 'package:gallery/bloc/galleryBloc/gallery_bloc.dart';
import 'package:gallery/bloc/loginBloc/login_bloc.dart';
import 'package:gallery/view/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dependanceInjection.dart';

void main() {
  initGetIt();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
const   MyApp({super.key}) ;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
    minTextAdapt: true,
    splitScreenMode: true,

    builder: (context,child)=>
    MultiBlocProvider(providers: [ BlocProvider(
        create: (context)=>getIt<LoginBloc>()),
    BlocProvider(create: (context)=>getIt<GalleryBloc>())
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: const Login(),

      ),)
    );
  }
}
