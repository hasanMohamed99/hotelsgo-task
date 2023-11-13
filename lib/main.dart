import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelsgo_task/generated/assets.dart';
import 'package:hotelsgo_task/layout/cubit/hotel_cubit.dart';
import 'package:hotelsgo_task/layout/hotels_layout.dart';
import 'package:hotelsgo_task/shared/network/dio_helper.dart';
import 'package:hotelsgo_task/shared/styles/colors.dart';
import 'package:lottie/lottie.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Connectivity connectivity = Connectivity();
    return BlocProvider(
      create: (context) =>
          HotelCubit(connectivity: connectivity)..getHotelsList(),
      child: BlocBuilder<HotelCubit, HotelState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(360, 780),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) {
              return MaterialApp(
                theme: ThemeData(primarySwatch: primaryBlack),
                themeMode: ThemeMode.light,
                debugShowCheckedModeBanner: false,
                home: child,
              );
            },
            child: state is AppIsDisconnectedState
                ? Scaffold(
                    backgroundColor: AppColors.bgColor,
                    body: Center(
                      child: Lottie.asset(
                        Assets.assetsNoInternet,
                      ),
                    ),
                  )
                : const HomeScreen(),
          );
        },
      ),
    );
  }
}
