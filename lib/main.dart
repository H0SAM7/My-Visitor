import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_visitor/bloc_observer.dart';
import 'package:my_visitor/core/routes/app_routes.dart';
import 'package:device_preview/device_preview.dart';
import 'package:my_visitor/features/auth/manager/auth_cubit/auth_cubit.dart';
import 'package:my_visitor/features/hotels/data/models/hotel_model/hotel_model.dart';
import 'package:my_visitor/features/hotels/presentation/manager/hotel_cubit/hotel_cubit.dart';
import 'package:my_visitor/firebase_options.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_visitor/keys/hive_keys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HotelModelAdapter());

  Hive.registerAdapter(SearchMetadataAdapter());
  Hive.registerAdapter(SearchParametersAdapter());
  Hive.registerAdapter(SearchInformationAdapter());
  Hive.registerAdapter(BrandsAdapter());
  Hive.registerAdapter(PropertiesAdapter());
  Hive.registerAdapter(SerpapiPaginationAdapter());
  Hive.registerAdapter(ReviewsBreakdownAdapter());
  Hive.registerAdapter(RatingsAdapter());
  Hive.registerAdapter(ImagesAdapter());
  Hive.registerAdapter(NearbyPlacesAdapter());
  Hive.registerAdapter(TransportationsAdapter());
  Hive.registerAdapter(TotalRateAdapter());
  Hive.registerAdapter(RatePerNightAdapter());
  Hive.registerAdapter(GpsCoordinatesAdapter());
  Hive.registerAdapter(ChildrenAdapter());
  await Hive.openBox<HotelModel>(kHotelsBox);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserever();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
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
              darkTheme: ThemeData.dark(), // Dark Theme

              themeMode: ThemeMode.dark,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.black,
                fontFamily: GoogleFonts.manrope().fontFamily,
              ),
              initialRoute: AppRoutes.initialRoute,
              routes: AppRoutes.routes,
                 onGenerateRoute:
            AppRoutes.generateRoute, // Handles dynamic routes with arguments

            );
          }),
    );
  }
}
