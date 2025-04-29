import 'package:firebase_core/firebase_core.dart'          ;
import 'package:flutter/material.dart'                     ;
import 'package:flutter/services.dart'                     ;
import 'package:flutter_bloc/flutter_bloc.dart'            ;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart'        ;
import 'package:my_visitor/bloc_observer.dart'         ;
import 'package:my_visitor/core/routes/app_routes.dart';
import 'package:device_preview/device_preview.dart'    ;
import 'package:my_visitor/core/utils/hive_inits.dart' ;
import 'package:my_visitor/features/ML/data/models/detection_model.dart';
import 'package:my_visitor/features/auth/manager/auth_cubit/auth_cubit.dart';
import 'package:my_visitor/features/hotels/presentation/manager/hotel_cubit/hotel_cubit.dart';
import 'package:my_visitor/features/landmarks/presentation/manager/landmark_cubit/landmark_cubit.dart';
import 'package:my_visitor/features/resturants/presentation/manager/resrurant_cubit.dart';
import 'package:my_visitor/firebase_options.dart';
import 'package:hive_flutter/adapters.dart'      ;
import 'package:my_visitor/keys/hive_keys.dart'  ;

//  home 

//  translation

//  settings 

//  drawer

//  redesign chat 




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await hiveInit();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserever();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(),
    ),
  );
  });
  
}
// @ hive annotations
// the hotels from 0 to 15
// resturants from 20 to 29

Future<void> hiveInit() async {
  await Hive.initFlutter();
  await hotelsInit();
  await resturantInit();

  Hive.registerAdapter(DetectionModelAdapter());
  await Hive.openBox<DetectionModel>(kMlData);

  await landmarksInit();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => HotelCubit()..fetchHotels(),
          lazy: true,
        ),
             BlocProvider(
          create: (context) =>RestrurantCubit()..getAllResturants(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) =>LandmarkCubit()..fetchLandmarks(),
          lazy: true,
        ),
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MaterialApp(
              // useInheritedMediaQuery: true,
              // locale: DevicePreview.locale(context),
              // builder: DevicePreview.appBuilder,
              darkTheme: ThemeData.dark(), 

              themeMode: ThemeMode.dark,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.black,
                fontFamily: GoogleFonts.manrope().fontFamily,
              ),
              initialRoute: AppRoutes.initialRoute,
              routes: AppRoutes.routes,
              onGenerateRoute: AppRoutes
                  .generateRoute, 
                  
                  
            );
          }),
    );
  }
}
