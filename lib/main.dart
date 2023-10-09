import 'package:candidate_vote/Crud/crud.dart';
import 'package:candidate_vote/bloc/home_bloc/home_cubit.dart';
import 'package:candidate_vote/home/home_screen.dart';
import 'package:candidate_vote/home/main_screen.dart';
import 'package:candidate_vote/login/login_screen.dart';
import 'package:candidate_vote/models/homeData.dart';
import 'package:candidate_vote/models/userHome.dart';
import 'package:candidate_vote/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login_bloc/login_cubit.dart';
import 'constant/constant.dart';
import 'local/cache_helper.dart';
import 'method.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHepler.init();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.cyan,
  ));
  var id = CacheHepler.getData(key: "id") ;
  Widget? firstScreen ;
  if(id == null){
    id=0;
  }
  if(id != 0){
    await Crud.postData(linkUrl: LOGINBYID_CANDID, data: {
      "candidate_id": id.toString() ,
    }).then((value){
      homeData = HomeData.fromJson(value);
      firstScreen = Main_Screen(userHome: homeData!,);
    }).catchError((onError){
      print(onError.toString());
    });
  }
  else {
    firstScreen = LoginScreen();
  }
  runApp(MyApp(firstScreen: firstScreen!,));


}

class MyApp extends StatelessWidget {
  final Widget firstScreen ;
   MyApp({required this.firstScreen});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => HomeCubit(),)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            elevation: 0 ,

            systemOverlayStyle: SystemUiOverlayStyle(
              // Status bar color
              statusBarColor: Colors.cyan,
              // Status bar brightness (optional)
              statusBarIconBrightness: Brightness.light, // For Android (dark icons)
              statusBarBrightness: Brightness.light, // For iOS (dark icons)
            ),
          ),
          fontFamily: 'jannah',

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
          useMaterial3: true,
        ),
        home:  Directionality(textDirection: TextDirection.rtl, child: SplashScreen(firstScreen: firstScreen))
      ),
    );
  }
}
