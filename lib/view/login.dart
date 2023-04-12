import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery/bloc/loginBloc/login_bloc.dart';
import 'package:gallery/view/gellary.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController =
      TextEditingController(text: ' hayes.freida@example.org');
  TextEditingController passwordController =
      TextEditingController(text: 'password');
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  LoginBloc? loginBloc;
  @override
  Widget build(BuildContext context) {
    loginBloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.h),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'My\nGallery',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40.h,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 40.h, bottom: 40.h, right: 30.h, left: 30.h),
                  child: Column(
                    children: [
                      Form(
                        key: _globalKey,
                        child: Column(
                          children: [
                            Text(
                              "LOGIN IN",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.sp),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "email",
                                    contentPadding: EdgeInsets.all(15.h),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide.none))),
                            SizedBox(
                              height: 40.h,
                            ),
                            TextFormField(
                                obscureText: true,
                                controller: passwordController,
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "password",
                                    contentPadding: EdgeInsets.all(15.h),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: BorderSide.none))),
                            SizedBox(
                              height: 40.h,
                            ),
                          ],
                        ),
                      ),
                      BlocConsumer<LoginBloc, LoginState>(
                        listener: (context, state) {
                          if (state is Loaded) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Gallery()));
                          }
                        },
                        builder: (context, state) {
                          if (state is Loading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          return ElevatedButton(
                            onPressed: () {
                              loginBloc!.add(LogIn(emailController.value.text,
                                  passwordController.value.text));
                            },
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width, 45.h),
                                // backgroundColor: colorDark,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Text(
                              'SUBMIT',
                              style: TextStyle(fontSize: 16.sp),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
