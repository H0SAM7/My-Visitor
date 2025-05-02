import 'package:firebase_core/firebase_core.dart'          ;
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart'                     ;
import 'package:flutter/services.dart'                     ;
import 'package:flutter_bloc/flutter_bloc.dart'            ;
import 'package:flutter_localizations/flutter_localizations.dart';
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
import 'package:my_visitor/generated/l10n.dart';
import 'package:my_visitor/keys/hive_keys.dart'  ;
import 'package:supabase_flutter/supabase_flutter.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await hiveInit();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  // Enable Crashlytics (disable in debug mode if needed)
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FirebaseCrashlytics.instance.log('Higgs-Boson detected!');
FirebaseCrashlytics.instance.setUserIdentifier('user_12345');
FirebaseCrashlytics.instance.setCustomKey('example_key', 'example_value');
   FirebaseMessaging messaging = FirebaseMessaging.instance;
   await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  await Supabase.initialize(
    url: 'https://crgwwfzifppleytrqcmh.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNyZ3d3ZnppZnBwbGV5dHJxY21oIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzkyMjI0MzksImV4cCI6MjA1NDc5ODQzOX0.cjC38O9-YnZ916IaZDQXee4ONfdnV3Fy14ymnpOAZ4c',
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
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
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
