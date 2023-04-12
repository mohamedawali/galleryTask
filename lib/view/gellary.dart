import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../bloc/galleryBloc/gallery_bloc.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  GalleryBloc? galleryBloc;
  @override
  Widget build(BuildContext context) {
    galleryBloc = BlocProvider.of<GalleryBloc>(context);
    galleryBloc!.add(GetImages());
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(top: 50.h,right: 20.h,left: 20.h),
        child: Column(
          children: [
            Row(
              children:  [
                Text(
                  'Welcome\nMina',
                  style: TextStyle(fontSize: 22.sp),
                ),
                const Spacer(),
                CircleAvatar(
                  radius: 20.r,backgroundImage: NetworkImage('https://howtodrawforkids.com/wp-content/uploads/2020/08/how-to-draw-a-Person.jpg'),
                )
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13))),
                    child: Row(
                      children:  [
                        const Icon(
                          Icons.logout_outlined,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        const Text(
                          'Log out',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        openDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13))),
                      child: Row(
                        children:  [
                          const Icon(
                            Icons.upload,
                            color: Colors.orange,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          const Text(
                            'Upload',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Expanded(child: BlocBuilder<GalleryBloc, GalleryState>(
                builder: (context, state) {
              if (state is GetImagesState) {
                List<String> images = state.imagesResponse.data!.images!;

                return GridView.builder(
                    itemCount: images.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                    itemBuilder: (context, index) => Card(
                          color: Colors.indigo,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                images[index],
                                fit: BoxFit.cover,
                              )),
                        ));
              }
              return const Center(child: CircularProgressIndicator());
            }))
          ],
        ),
      ),
    );
  }
  void openDialog(BuildContext context)  {
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            backgroundColor: Colors.grey.withOpacity(0.3),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            scrollable: true,
            contentPadding: EdgeInsets.zero,
            content:

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 40.h, vertical: 40.h),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {pickImage('gallery');},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: Size(MediaQuery.of(context).size.width, 50.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13))),
                    child: Row(
                      children:  [
                        const Icon(
                          Icons.photo_library_outlined,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        const Text(
                          'Gallery',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  ElevatedButton(
                    onPressed: () {pickImage("camera");},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: Size(MediaQuery.of(context).size.width, 50.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13))),
                    child: Row(
                      children:  [
                        const Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        const Text(
                          'Camera',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
  Future pickImage(String? type) async {
    XFile? image;
    ImagePicker imagePicker = ImagePicker();
    if(type=='camera'){
    image = await imagePicker.pickImage(source: ImageSource.camera);}else{

 image = await imagePicker.pickImage(source: ImageSource.gallery);
    }
    File file = File(image!.path);

    galleryBloc!.add(UploadImage(file));
    // ignore: use_build_context_synchronously
    Navigator.pop(context);

    setState(() {

    });
  }


}
