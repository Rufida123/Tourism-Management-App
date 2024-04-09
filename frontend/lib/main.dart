import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_app/components/navigation_service.dart';
import 'package:tourism_app/data/web_service/service_provider/account_verification_web.dart';
import 'package:tourism_app/data/web_service/service_provider/login_web.dart';
import 'package:tourism_app/data/web_service/service_provider/signUp_web.dart';
import 'package:tourism_app/data/web_service/user/account_verification_web.dart';
import 'package:tourism_app/data/web_service/user/login_web.dart';
import 'package:tourism_app/data/web_service/user/signUp_web.dart';
import 'package:tourism_app/pages/Service_provider/cubits/login_cubit/login_cubit.dart';
import 'package:tourism_app/pages/Service_provider/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:tourism_app/pages/Service_provider/cubits/verification_cubits/account_verification_cubit.dart';
import 'package:tourism_app/pages/Service_provider/forget_password.dart';
import 'package:tourism_app/pages/Service_provider/login_page.dart';
import 'package:tourism_app/pages/Service_provider/sign_up_page.dart';
import 'package:tourism_app/pages/User/account_verification.dart';
import 'package:tourism_app/pages/User/cubits/verification_cubit/account_verification_cubit.dart';
import 'package:tourism_app/pages/User/forgot_Password.dart';
import 'package:tourism_app/pages/User/cubits/login_cubit/login_cubit.dart';
import 'package:tourism_app/pages/User/cubits/signup_cubit/cubit/signup_cubit.dart';
import 'package:tourism_app/pages/User/login_page.dart';
import 'package:tourism_app/pages/Service_provider/service_providing.dart';
import 'package:tourism_app/pages/User/sign_up_page.dart';
import 'package:tourism_app/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginUserCubit>(
            create: (context) => LoginUserCubit(LoginUserWeb())),
        BlocProvider<SignUpUserCubit>(
          create: (context) => SignUpUserCubit(SignUpUserWeb()),
        ),
        BlocProvider<LoginProviderCubit>(
            create: (context) => LoginProviderCubit(LoginProviderWeb())),
        BlocProvider<SignUpProviderCubit>(
          create: (context) => SignUpProviderCubit(SignUpProviderWeb()),
        ),
        BlocProvider<UserAccVerifiCubit>(
          create: (context) => UserAccVerifiCubit(AccVerifiUserWeb()),
        ),
        BlocProvider<ProviderAccVerifiCubit>(
          create: (context) => ProviderAccVerifiCubit(AccVerifiProviderWeb()),
        )
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: 'login',
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 103, 194, 180),
        ),
        home: WelcomePage(),
        debugShowCheckedModeBanner: false,
        routes: {
          '/UserSignUp': (context) => UserSignUpPage(),
          '/ProviderSignUp': (context) => ProviderSignUpPage(),
          '/ServiceProviding': (context) => ServiceProviding(),
          '/UserLogin': (context) => UserLoginPage(),
          '/ProviderLogin': (context) => ProviderLoginPage(),
          '/UserForgotPassword': (context) => UserForgotPassword(),
          '/ProviderForgotPassword': (context) => ProviderForgotPassword(),
          '/UserAccVerification': (context) => UserAccVerification(),
        },
      ),
    );
  }
}
